This plugin is documented with Markdown in Literate CoffeeScript

Goals:
1. Open dropdown on click
2. Close dropdown when click happens outside of open dropdown
3. Selecting dropdown item should put its content in the action button

See `demo/index.html` for example markup and usage

    factory = ($) ->
      namespace = 'macula'
      pluginName = 'mDropdown'
      ns = "#{namespace}.#{pluginName}"
      instances = []
      defaults =
        toggleSelector: '.m-dropdown--toggle'
        menuSelector: '.m-dropdown--menu li'
        selectedClass: 'is-selected'

Close all dropdowns when user clicks (individual instance will open itself)

      closeAll = -> $(instances).removeClass 'is-open'

      $(document).on "click.#{ns}", closeAll

      class Dropdown

        constructor: (element, options) ->
          @settings = $.extend {}, defaults, options
          @$el = $(element)

          @$el
            .on "click.#{ns}", @toggle
            .on "click.#{ns}", @settings.menuSelector, (e) => @select e

Toggling opens if its closed and closes if its open. Also closes other dropdowns

        toggle: (evt) ->
          isActive = $(@).hasClass 'is-open'

          closeAll()

          $(@).toggleClass 'is-open' unless isActive

          return false

Selecting an item will replace the toggle's content with either the data attribute matching this plugin's name or its text. An event will also fire with the same content attached. We also add a configurable class to the current target and remove it from its siblings.

        select: (evt) ->
          $this = $(evt.currentTarget).addClass @settings.selectedClass
          content = $this.data(pluginName) or $this.text().trim()

          $this.siblings().removeClass @settings.selectedClass

          @$el.trigger $.Event "select.#{ns}", content: content
            .find(@settings.toggleSelector).text content

Prevent against multiple instantiations with lightweight plugin wrapper

      $.fn[pluginName] = (options) ->
        @each ->
          unless $.data @, ns
            d = new Dropdown @, options
            instances.push @
            $.data @, ns, d

      return

[Uses AMD or browser globals to create a jQuery plugin](1)

    do (factory) ->
      if typeof define is 'function' and define.amd
        define ['jquery'], factory
      else
        factory jQuery

[1]: https://github.com/umdjs/umd/blob/master/jqueryPlugin.js
