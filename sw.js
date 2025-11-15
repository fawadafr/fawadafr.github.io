/*
 * Service Worker for Fawad Rashidi CTO Website
 * Implements offline-first caching strategy with network fallback
 * Version: 1.0.0
 */

const CACHE_VERSION = 'v1.0.0';
const CACHE_NAME = `fawad-rashidi-${CACHE_VERSION}`;

// Assets to cache immediately on install
const PRECACHE_ASSETS = [
  '/',
  '/assets/main.css',
  '/manifest.json',
  '/assets/icons/icon-192x192.png',
  '/assets/icons/icon-512x512.png'
];

// Cache strategies
const CACHE_STRATEGIES = {
  // Cache first, network fallback (for static assets)
  CACHE_FIRST: 'cache-first',
  // Network first, cache fallback (for dynamic content)
  NETWORK_FIRST: 'network-first',
  // Network only (for analytics, external resources)
  NETWORK_ONLY: 'network-only'
};

/**
 * Service Worker Installation
 * Pre-cache critical assets
 */
self.addEventListener('install', (event) => {
  console.log('[SW] Installing service worker...');

  event.waitUntil(
    caches.open(CACHE_NAME)
      .then((cache) => {
        console.log('[SW] Pre-caching assets...');
        return cache.addAll(PRECACHE_ASSETS);
      })
      .then(() => {
        console.log('[SW] Pre-cache complete');
        return self.skipWaiting(); // Activate immediately
      })
      .catch((error) => {
        console.error('[SW] Pre-cache failed:', error);
      })
  );
});

/**
 * Service Worker Activation
 * Clean up old caches
 */
self.addEventListener('activate', (event) => {
  console.log('[SW] Activating service worker...');

  event.waitUntil(
    caches.keys()
      .then((cacheNames) => {
        return Promise.all(
          cacheNames
            .filter((cacheName) => {
              // Delete old caches
              return cacheName.startsWith('fawad-rashidi-') && cacheName !== CACHE_NAME;
            })
            .map((cacheName) => {
              console.log('[SW] Deleting old cache:', cacheName);
              return caches.delete(cacheName);
            })
        );
      })
      .then(() => {
        console.log('[SW] Activation complete');
        return self.clients.claim(); // Take control immediately
      })
  );
});

/**
 * Fetch Event Handler
 * Implements intelligent caching strategy
 */
self.addEventListener('fetch', (event) => {
  const { request } = event;
  const url = new URL(request.url);

  // Skip cross-origin requests (CDNs, analytics, etc.)
  if (url.origin !== location.origin) {
    // Network only for external resources
    return;
  }

  // Determine caching strategy based on request type
  const strategy = getCachingStrategy(url);

  if (strategy === CACHE_STRATEGIES.CACHE_FIRST) {
    event.respondWith(cacheFirst(request));
  } else if (strategy === CACHE_STRATEGIES.NETWORK_FIRST) {
    event.respondWith(networkFirst(request));
  }
  // NETWORK_ONLY requests are not intercepted
});

/**
 * Determine caching strategy based on URL
 */
function getCachingStrategy(url) {
  // Static assets: Cache first
  if (
    url.pathname.match(/\.(css|js|woff2?|ttf|otf|eot|svg|png|jpg|jpeg|gif|webp|ico)$/) ||
    url.pathname.startsWith('/assets/')
  ) {
    return CACHE_STRATEGIES.CACHE_FIRST;
  }

  // HTML pages: Network first (for fresh content)
  if (
    url.pathname === '/' ||
    url.pathname.endsWith('.html') ||
    url.pathname.endsWith('/')
  ) {
    return CACHE_STRATEGIES.NETWORK_FIRST;
  }

  // Default: Network first
  return CACHE_STRATEGIES.NETWORK_FIRST;
}

/**
 * Cache First Strategy
 * Serve from cache, update cache in background
 */
async function cacheFirst(request) {
  const cachedResponse = await caches.match(request);

  if (cachedResponse) {
    // Return cached version immediately
    console.log('[SW] Cache hit:', request.url);

    // Update cache in background
    fetchAndCache(request);

    return cachedResponse;
  }

  // Not in cache, fetch from network
  console.log('[SW] Cache miss, fetching:', request.url);
  return fetchAndCache(request);
}

/**
 * Network First Strategy
 * Try network, fallback to cache if offline
 */
async function networkFirst(request) {
  try {
    const networkResponse = await fetch(request);

    // Cache successful responses
    if (networkResponse && networkResponse.status === 200) {
      const cache = await caches.open(CACHE_NAME);
      cache.put(request, networkResponse.clone());
    }

    return networkResponse;
  } catch (error) {
    // Network failed, try cache
    console.log('[SW] Network failed, trying cache:', request.url);
    const cachedResponse = await caches.match(request);

    if (cachedResponse) {
      console.log('[SW] Serving from cache (offline):', request.url);
      return cachedResponse;
    }

    // No cache available, return offline page or error
    return new Response(
      '<html><body><h1>Offline</h1><p>Please check your internet connection.</p></body></html>',
      {
        headers: { 'Content-Type': 'text/html' },
        status: 503,
        statusText: 'Service Unavailable'
      }
    );
  }
}

/**
 * Fetch from network and cache the response
 */
async function fetchAndCache(request) {
  try {
    const networkResponse = await fetch(request);

    // Only cache successful responses
    if (networkResponse && networkResponse.status === 200) {
      const cache = await caches.open(CACHE_NAME);
      cache.put(request, networkResponse.clone());
    }

    return networkResponse;
  } catch (error) {
    console.error('[SW] Fetch failed:', error);
    throw error;
  }
}

/**
 * Message Handler
 * Handle messages from clients (e.g., skip waiting)
 */
self.addEventListener('message', (event) => {
  if (event.data && event.data.type === 'SKIP_WAITING') {
    self.skipWaiting();
  }
});
