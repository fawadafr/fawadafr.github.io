---
layout: page
title: Writing
permalink: /writing/
---

# Writing

Technical thought leadership on platform engineering, distributed systems, and engineering culture.

{% assign all_posts = site.posts %}

{% if all_posts.size > 0 %}

## All Posts

<div class="post-list">
  {% for post in all_posts %}
  <article class="post-item">
    <div class="tag-list">
      {% if post.primary_tag %}
        <span class="tag">#{{ post.primary_tag }}</span>
      {% endif %}
      {% for tag in post.tags limit:2 %}
        <span class="tag">#{{ tag }}</span>
      {% endfor %}
    </div>

    <h3><a href="{{ post.url }}">{{ post.title }}</a></h3>

    <div class="post-meta">
      <span>{{ post.date | date: "%B %d, %Y" }}</span>
      {% if post.read_time %}
        <span> • {{ post.read_time }} min read</span>
      {% endif %}
    </div>

    <p>{{ post.excerpt | strip_html | truncatewords: 40 }}</p>

    <a href="{{ post.url }}">Read more →</a>
  </article>

  <hr style="border: none; border-top: 1px solid var(--color-border); margin: var(--space-8) 0;">
  {% endfor %}
</div>

{% else %}

## Featured Topics

I write about the intersection of technology strategy and execution. Here are some areas I focus on:

### Platform Engineering

Building internal developer platforms that enable engineering teams to move faster without sacrificing reliability. Topics include:
- Developer experience and productivity metrics
- Platform team operating models
- Self-service infrastructure patterns
- Internal developer portals and service catalogs

### Cloud Architecture

Pragmatic approaches to building scalable, cost-effective cloud infrastructure:
- Multi-region architecture patterns
- Kubernetes at scale
- Cost optimization and FinOps
- Infrastructure as Code best practices

### Engineering Culture

Creating high-performing, sustainable engineering organizations:
- Building cultures of ownership
- Hiring and growing engineering teams
- Incident response and postmortems
- Remote engineering team practices

### Technical Deep Dives

In-depth explorations of distributed systems, observability, and reliability engineering:
- Distributed tracing and debugging
- SRE practices and SLO-based alerting
- Database scaling patterns
- Service mesh and API gateways

---

## Stay Updated

Subscribe via [RSS](/feed.xml) to get notified of new posts.

{% endif %}

## Browse by Topic

Explore content by topic using the [tag browser](/tags/).
