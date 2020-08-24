---
layout: page
title: Blog
tagline: Ciencia de Datos • GECI
---

<ul>
  {% for post in site.posts %}
    <li>
      <b><a href="{{ post.url }}">{{ post.title }}</a></b>
      <i>{{ post.date | date_to_string }}.</i> {{ post.author }}
    </li>
  {% endfor %}
</ul>

---

<b><a href="/blog/temas">» Orden temático</a></b>
