This plugin is documented with Markdown in Literate CoffeeScript

Goals:
1. Open dropdown on click
2. Close dropdown when click happens outside of open dropdown
3. Selecting dropdown item should put its content in the action button

See `demo/index.html` for example markup and usage

    factory = ($) ->
      namespace = 'macula'
      pluginName = 'mDropdown'
      instances = []
      defaults =
        toggleSelector: '.m-dropdown--toggle'
        menuSelector: '.m-dropdown--menu li'

Close all dropdowns when user clicks (individual instance will open itself)

      closeAll = -> $(instances).removeClass 'is-open'

      $(document).on "click.#{namespace}.#{pluginName}", closeAll

      class Dropdown

        constructor: (@element, options) ->
          @settings = $.extend {}, defaults, options

          $(@element)
            .on "click.#{namespace}.#{pluginName}", @toggle
            .on "click.#{namespace}.#{pluginName}", @settings.menuSelector, (e) => @select e

Toggling opens if its closed and closes if its open. Also closes other dropdowns

        toggle: (evt) ->
          isActive = $(@).hasClass 'is-open'

          closeAll()

          $(@).toggleClass 'is-open' unless isActive

          return false

Selecting an item will replace the toggle's content like a native HTML select

        select: (evt) ->
          $(@element).find(@settings.toggleSelector).text $(evt.currentTarget).text().trim()

Prevent against multiple instantiations with lightweight plugin wrapper

      $.fn[pluginName] = (options) ->
        @each ->
          unless $.data @, "#{namespace}.#{pluginName}"
            d = new Dropdown @, options
            instances.push @
            $.data @, "#{namespace}.#{pluginName}", d

[Uses AMD or browser globals to create a jQuery plugin](1)

    do (factory) ->
      if typeof define is 'function' and define.amd
        define ['jquery'], factory
      else
        factory jQuery

[1]: https://github.com/umdjs/umd/blob/master/jqueryPlugin.js
