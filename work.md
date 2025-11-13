---
layout: page
title: Work
permalink: /work/
---

# Work & Case Studies

## Selected Projects & Transformations

Below are some of the technical transformations and platform builds I've led. Each represents real-world lessons in balancing speed, scale, and sustainability.

---

{% assign case_studies = site.case_studies %}
{% if case_studies.size > 0 %}
  {% for case_study in case_studies %}
  ### [{{ case_study.title }}]({{ case_study.url }})

  <div class="tag-list">
    {% for tag in case_study.tags %}
      <span class="tag">#{{ tag }}</span>
    {% endfor %}
  </div>

  {{ case_study.excerpt }}

  {% if case_study.outcomes %}
  **Key Outcomes:**
  {% for outcome in case_study.outcomes %}
  - {{ outcome }}
  {% endfor %}
  {% endif %}

  [Read the full case study →]({{ case_study.url }})

  ---
  {% endfor %}
{% else %}

### Zero-Downtime Migration to Cloud-Native Architecture

<div class="tag-list">
  <span class="tag">#case-study</span>
  <span class="tag">#cloud-architecture</span>
  <span class="tag">#kubernetes</span>
  <span class="tag">#platform-engineering</span>
</div>

Led the technical strategy and execution for migrating a monolithic application to microservices, serving 10M+ daily active users without a single minute of downtime.

**Key Outcomes:**
- 99.99% uptime maintained during migration
- 40% reduction in infrastructure costs
- Developer productivity increased 3x with new platform
- Zero customer-facing incidents

---

### Internal Developer Platform: From 6 Hours to 6 Minutes

<div class="tag-list">
  <span class="tag">#case-study</span>
  <span class="tag">#developer-experience</span>
  <span class="tag">#platform-engineering</span>
</div>

Built a self-service platform that reduced deployment time from 6 hours to 6 minutes, enabling teams to ship 10x more frequently.

**Key Outcomes:**
- Deployment time: 6 hours → 6 minutes
- Mean time to recovery (MTTR): 2 hours → 15 minutes
- Developer satisfaction (DSAT): 32% → 87%
- Platform adoption: 100% of engineering teams within 6 months

---

{% endif %}

## Open Source & Community

I'm an active contributor to the platform engineering and cloud-native communities. Selected open-source work and community contributions:

- Maintainer of several internal-turned-open-source platform tools
- Regular contributor to Kubernetes, Terraform, and observability tooling
- Conference talks on platform engineering and SRE practices

## Let's Work Together

Interested in collaborating? I'm available for:
- Technical advisory for startups and scale-ups
- Platform engineering strategy consultations
- Architecture reviews and technical due diligence
- Speaking engagements and workshops

[Get in touch](/contact/) to discuss opportunities.
