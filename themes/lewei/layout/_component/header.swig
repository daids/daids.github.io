<div class="container mx-auto pt-8">
  <h1 class="block font-sans text-black text-5xl font-thin pt-8 pb-2">{{ config.title }}</h1>
  <small class="block text-sm text-grey-dark font-light py-6">{{config.subtitle}}</small>
  <nav class=" block text-lg mt-8">
    {% if theme.menu %}
      <ul id="menu" class="flex list-reset font-sans font-thin py-3">
        {% for name, path in theme.menu %}
          <li class="mr-8">
            <a href="{{ url_for(path.split('||')[0]) | trim }}" rel="section" class="text-dark hover:text-blue-darker no-underline">
              {{ __('menu.' + name) | replace('menu.', '') }}
            </a>
          </li>
        {% endfor %}
      </ul>
    {% endif %}
  </nav>
</div>