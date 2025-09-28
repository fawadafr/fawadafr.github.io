---
layout: page
title: Insight Briefings
permalink: /insights/
---

Stay ahead of the curve with Farida's latest essays, keynote reflections, and
boardroom takeaways. Each briefing distills actionable perspectives for leaders
navigating complexity.

<ul class="post-list">
  {% for post in site.posts %}
    <li>
      <span class="post-meta">{{ post.date | date: "%B %d, %Y" }}</span>
      <h2><a class="post-link" href="{{ post.url }}">{{ post.title }}</a></h2>
      <p>{{ post.excerpt | strip_html | truncate: 180 }}</p>
    </li>
  {% endfor %}
</ul>
