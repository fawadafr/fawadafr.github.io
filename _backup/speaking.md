---
layout: page
title: Speaking
permalink: /speaking/
---

# Speaking & Workshops

I speak at conferences, corporate events, and workshops on platform engineering, cloud architecture, and engineering leadership.

## Topics

### Platform Engineering

- **Building Internal Developer Platforms That Scale** - Lessons from building developer platforms that reduced deployment time from hours to minutes
- **Platform Teams: Product Thinking for Infrastructure** - How to run platform teams like product teams with clear metrics and customer focus
- **Developer Experience as Competitive Advantage** - Measuring and improving developer productivity and satisfaction

### Cloud Architecture & Infrastructure

- **Multi-Region Architecture Without Over-Engineering** - Pragmatic approaches to global infrastructure
- **Kubernetes in Production: What They Don't Tell You** - Real-world lessons from running large-scale Kubernetes clusters
- **FinOps: Making Cloud Costs a First-Class Metric** - Strategies for cost-effective cloud architecture

### Engineering Leadership

- **Building Cultures of Ownership** - Creating environments where engineers truly own their systems
- **Scaling Engineering Teams Without Losing Culture** - Growing from 10 to 100+ engineers while maintaining values
- **The Modern CTO: From Code to Strategy** - Transitioning from hands-on technical work to strategic leadership

### SRE & Reliability

- **SLOs That Actually Matter** - Moving beyond vanity metrics to meaningful reliability targets
- **Incident Response: Building Learning Organizations** - Blameless postmortems and continuous improvement
- **Observability in Distributed Systems** - Patterns for debugging complex, distributed architectures

## Past Engagements

{% assign speaking_engagements = site.speaking %}
{% if speaking_engagements.size > 0 %}
  {% for engagement in speaking_engagements %}
  ### {{ engagement.title }}

  **{{ engagement.event }}** • {{ engagement.date | date: "%B %Y" }}
  {% if engagement.location %}
  • {{ engagement.location }}
  {% endif %}

  {{ engagement.excerpt }}

  {% if engagement.recording_url or engagement.slides_url %}
  **Resources:**
  {% if engagement.recording_url %}
  - [Watch Recording]({{ engagement.recording_url }})
  {% endif %}
  {% if engagement.slides_url %}
  - [View Slides]({{ engagement.slides_url }})
  {% endif %}
  {% endif %}

  ---
  {% endfor %}
{% else %}

### Recent Talks

- **CTO Summit 2025** - "Building Engineering Culture at Scale"
- **Platform Engineering Conference 2024** - "Developer Platforms: From Zero to Production"
- **KubeCon North America 2024** - "Running Kubernetes at Scale: Lessons Learned"
- **DevOps Days** - "SRE Practices for Startups and Scale-Ups"

{% endif %}

## Book a Speaking Engagement

I'm available for:
- Conference keynotes and technical talks
- Corporate workshops and training sessions
- Podcast and webinar appearances
- Panel discussions and fireside chats

**Contact:** john@example.com

When reaching out, please include:
- Event name, date, and location (virtual or in-person)
- Expected audience size and profile
- Topic or theme of interest
- Format (keynote, workshop, panel, etc.)
