<!DOCTYPE html>
{% set html_class = 'theme-lewei' %}
<html class="{{ html_class | lower }} h-full" lang="{{ config.language }}">
<head>
  <title>{% block title %}{% endblock %}</title>
  {% include '_component/head.swig' %}
</head>
<body class="h-full">
  {% set container_class = "flex flex-col h-full" %}
  {% if theme.sidebar.position %}
    {% set container_class = container_class + 'sidebar-position-' + theme.sidebar.position %}
  {% endif %}
  <div class="{{ container_class }} {% block page_class %}{% endblock %}">
    <header id="header" class="flex-no-grow flex-no-shrink bg-grey-lighter">
      <div class="header-inner"> {% include '_component/header.swig' %} </div>
    </header>
    <main id="main" class="flex-auto">
      <div class="main-inner">
        <div class="content-wrap">
          <div id="content" class="content py-8">
            {% block content %}{% endblock %}
          </div>
        </div>
        {% if theme.sidebar.display !== 'remove' %}
          {% block sidebar %}{% endblock %}
        {% endif %}
      </div>
    </main>
    <footer id="footer" class="flex-no-grow flex-no-shrink bg-grey-lighter h-16">
      <div class="footer-inner">
        {% include '_component/footer.swig' %}
        {% block footer %}{% endblock %}
      </div>
    </footer>

    {% if not theme.sidebar.b2t %}
      <div class="back-to-top">
        <i class="fa fa-arrow-up"></i>
        {% if theme.sidebar.scrollpercent %}
          <span id="scrollpercent"><span>0</span>%</span>
        {% endif %}
      </div>
    {% endif %}
  </div>
</body>
</html>
