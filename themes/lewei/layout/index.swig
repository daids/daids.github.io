{% extends '_layout.swig' %}

{% block title %}{{ config.title }}{% if theme.index_with_subtitle and config.subtitle %} - {{config.subtitle }}{% endif %}{% endblock %}

{% block page_class %}
  {% if is_home() %}page-home{% endif -%}
{% endblock %}

{% block content %}
<div class="container mx-auto">
  <section id="posts" class="posts-expand">
    {% for post in page.posts %}
    <div class="shadow mt-8 py-4 px-6 bg-grey-lightest">
        <h2 class="font-thin text-dark text-3xl py-8"><a class="text-dark no-underline" target="_blank" href="{{ url_for(post.link) }}">{{ post.title }}</a></h2>
        <div class="post-content py-8 font-light text-lg">
            {{ post.description }}
        </div>
        <div class="text-center my-4">
      <a class="inline-block bg-transparent hover:bg-blue text-blue-dark font-sans font-light hover:text-white py-2 px-4 border border-blue hover:border-transparent rounded no-underline" target="_blank" href="{{ url_for(post.link) }}">Read More</a>     
        </div>
        <div class="tags py-3">
          {% if post.tags and post.tags.length and not is_index %}
            <div class="post-tags">
              {% for tag in post.tags %}
                <a class="text-blue hover:text-blue-darker bg-grey-lighter rounded-full no-underline text-light text-sm py-2 px-3" href="{{ url_for(tag.path) }}" rel="tag">#{{ tag.name }}</a>
              {% endfor %}
            </div>
          {% endif %}
        </div>
    </div>
    {% endfor %}
  </section>
</div>
{% endblock %}

{% block sidebar %}
{% endblock %}
