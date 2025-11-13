---
layout: page
title: Tags
permalink: /tags/
---

# Explore by Topic

Browse all content by topic. Tags represent the main themes and technologies covered across writing, case studies, and speaking engagements.

<div class="tag-browser">
  {% capture tags %}
    {% for post in site.posts %}
      {% if post.tags %}
        {% for tag in post.tags %}
          {{ tag }}|
        {% endfor %}
      {% endif %}
    {% endfor %}
    {% for case_study in site.case_studies %}
      {% if case_study.tags %}
        {% for tag in case_study.tags %}
          {{ tag }}|
        {% endfor %}
      {% endif %}
    {% endfor %}
  {% endcapture %}

  {% assign sorted_tags = tags | split:'|' | sort | uniq %}

  {% if sorted_tags.size > 0 %}
    <div class="tag-list" style="margin-bottom: var(--space-12);">
      {% for tag in sorted_tags %}
        {% if tag != "" %}
          <a href="#{{ tag | slugify }}" class="tag">#{{ tag }}</a>
        {% endif %}
      {% endfor %}
    </div>

    <hr style="border: none; border-top: 1px solid var(--color-border); margin: var(--space-12) 0;">

    {% for tag in sorted_tags %}
      {% if tag != "" %}
        <div id="{{ tag | slugify }}" style="margin-bottom: var(--space-16);">
          <h2 style="font-size: var(--text-display-m); margin-bottom: var(--space-6);">#{{ tag }}</h2>

          {% assign tag_posts = site.posts | where_exp: "post", "post.tags contains tag" %}
          {% assign tag_cases = site.case_studies | where_exp: "case", "case.tags contains tag" %}

          {% if tag_posts.size > 0 %}
            <h3 style="font-size: var(--text-display-s); margin-bottom: var(--space-4); color: var(--color-text-secondary);">Writing</h3>
            <ul style="margin-bottom: var(--space-6);">
              {% for post in tag_posts %}
                <li>
                  <a href="{{ post.url }}">{{ post.title }}</a>
                  <span style="color: var(--color-text-secondary); font-size: var(--text-detail-xs);"> • {{ post.date | date: "%b %Y" }}</span>
                </li>
              {% endfor %}
            </ul>
          {% endif %}

          {% if tag_cases.size > 0 %}
            <h3 style="font-size: var(--text-display-s); margin-bottom: var(--space-4); color: var(--color-text-secondary);">Case Studies</h3>
            <ul>
              {% for case_study in tag_cases %}
                <li>
                  <a href="{{ case_study.url }}">{{ case_study.title }}</a>
                </li>
              {% endfor %}
            </ul>
          {% endif %}

          <hr style="border: none; border-top: 1px solid var(--color-border); margin: var(--space-8) 0;">
        </div>
      {% endif %}
    {% endfor %}
  {% else %}
    <div class="content-card" style="max-width: var(--content-width); margin: 0 auto;">
      <h2 style="margin-bottom: var(--space-4);">Common Topics</h2>
      <p style="margin-bottom: var(--space-6);">
        Content is organized by topic tags. Once content is published, tags will appear here automatically.
      </p>

      <div class="tag-list">
        <span class="tag">#platform-engineering</span>
        <span class="tag">#cloud-architecture</span>
        <span class="tag">#engineering-culture</span>
        <span class="tag">#kubernetes</span>
        <span class="tag">#aws</span>
        <span class="tag">#sre</span>
        <span class="tag">#devops</span>
        <span class="tag">#developer-experience</span>
        <span class="tag">#case-study</span>
        <span class="tag">#leadership</span>
      </div>
    </div>
  {% endif %}
</div>
