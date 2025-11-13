---
layout: home
title: "Home"
permalink: /
---

<section class="hero">
  <h1>Building resilient systems and high-performing engineering teams</h1>
  <p class="subtitle">
    CTO with 15+ years shipping distributed systems at scale.
    Focused on pragmatic architecture, developer experience, and sustainable growth.
  </p>
  <div class="hero-tags">
    <a href="/tags#platform-engineering" class="tag">#platform-engineering</a>
    <a href="/tags#engineering-culture" class="tag">#engineering-culture</a>
    <a href="/tags#cloud-architecture" class="tag">#cloud-architecture</a>
  </div>
</section>

<section class="section">
  <h2 class="section-title">Featured Writing</h2>
  <div class="content-grid">
    {% assign featured_posts = site.posts | where: "featured", true | limit: 3 %}
    {% if featured_posts.size > 0 %}
      {% for post in featured_posts %}
        <article class="content-card">
          <span class="card-tag">#{{ post.primary_tag }}</span>
          <h3 class="card-title">
            <a href="{{ post.url }}">{{ post.title }}</a>
          </h3>
          <p class="card-excerpt">{{ post.excerpt | strip_html | truncatewords: 30 }}</p>
          <div class="card-meta">
            <span>{{ post.date | date: "%b %d, %Y" }}</span>
            {% if post.read_time %}
              <span>{{ post.read_time }} min read</span>
            {% endif %}
          </div>
        </article>
      {% endfor %}
    {% else %}
      <article class="content-card">
        <span class="card-tag">#technical-deep-dive</span>
        <h3 class="card-title">
          <a href="/writing">Explore Writing</a>
        </h3>
        <p class="card-excerpt">
          Technical thought leadership on platform engineering, cloud architecture, and engineering culture.
        </p>
      </article>
    {% endif %}
  </div>
</section>

<section class="section">
  <h2 class="section-title">Recent Work</h2>

  {% assign case_studies = site.case_studies | limit: 2 %}
  {% if case_studies.size > 0 %}
    {% for case_study in case_studies %}
      <div class="case-study-card">
        <div class="tag-list">
          <span class="tag">#case-study</span>
          {% for tag in case_study.tags limit:2 %}
            <span class="tag">#{{ tag }}</span>
          {% endfor %}
        </div>
        <h3 class="case-study-title">{{ case_study.title }}</h3>
        <p class="case-study-description">{{ case_study.excerpt | strip_html }}</p>
        <a href="{{ case_study.url }}" class="case-study-link">View Case Study</a>
      </div>
    {% endfor %}
  {% else %}
    <div class="case-study-card">
      <div class="tag-list">
        <span class="tag">#case-study</span>
        <span class="tag">#cloud-architecture</span>
        <span class="tag">#platform-engineering</span>
      </div>
      <h3 class="case-study-title">Zero-Downtime Migration to Cloud-Native Architecture</h3>
      <p class="case-study-description">
        Led the technical strategy and execution for migrating a monolithic application to microservices,
        serving 10M+ daily active users without a single minute of downtime.
      </p>
      <a href="/work" class="case-study-link">View Work</a>
    </div>
  {% endif %}
</section>
