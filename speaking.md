---
layout: page
title: Speaking & Advisory
permalink: /speaking/
---

Farida delivers executive-level keynotes, board briefings, and closed-door
strategy sessions tailored to your organization's transformation agenda.

### Signature Engagements

{% assign speaking_items = site.speaking | sort: 'title' %}
<ul>
  {% for talk in speaking_items %}
    <li>
      <h3><a href="{{ talk.url }}">{{ talk.title }}</a></h3>
      {% if talk.subtitle %}<p><em>{{ talk.subtitle }}</em></p>{% endif %}
      {% if talk.summary %}<p>{{ talk.summary }}</p>{% endif %}
    </li>
  {% endfor %}
</ul>

Looking for a bespoke experience? Reach out to the office with your objectives
and event timeline at [speaking@faridawada.com](mailto:speaking@faridawada.com).
