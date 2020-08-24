---
layout: page
title: Blog » Orden temático
tagline: Ciencia de Datos • GECI
---

{% for tag in site.tags %}
  {% assign tag_data = site.data.tags | where: 'id', tag[0] %}
  {% assign tag_name = tag_data[0].name %}
  <h3>{{ tag_name }}</h3>
  <ul>
    {% for post in tag[1] %}
      <li>
        <b><a href="{{ post.url }}">{{ post.title }}</a></b>
        <i>{{ post.date | date_to_string }}.</i> {{ post.author }}
      </li>
    {% endfor %}
  </ul>
{% endfor %}

---

<b><a href="/blog">« Orden cronológico</a></b>
