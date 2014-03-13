(function() {
  var factory;

  factory = function($) {
    var Dropdown, closeAll, defaults, instances, namespace, ns, pluginName;
    namespace = 'macula';
    pluginName = 'mDropdown';
    ns = "" + namespace + "." + pluginName;
    instances = [];
    defaults = {
      toggleSelector: '.m-dropdown--toggle',
      menuSelector: '.m-dropdown--menu li',
      selectedClass: 'is-selected'
    };
    closeAll = function() {
      return $(instances).removeClass('is-open');
    };
    $(document).on("click." + ns, closeAll);
    Dropdown = (function() {
      function Dropdown(element, options) {
        this.settings = $.extend({}, defaults, options);
        this.$el = $(element);
        this.$el.on("click." + ns, this.toggle).on("click." + ns, this.settings.menuSelector, (function(_this) {
          return function(e) {
            return _this.select(e);
          };
        })(this));
      }

      Dropdown.prototype.toggle = function(evt) {
        var isActive;
        isActive = $(this).hasClass('is-open');
        closeAll();
        if (!isActive) {
          $(this).toggleClass('is-open');
        }
        return false;
      };

      Dropdown.prototype.select = function(evt) {
        var $this, content;
        $this = $(evt.currentTarget).addClass(this.settings.selectedClass);
        content = $this.data(pluginName) || $this.text().trim();
        $this.siblings().removeClass(this.settings.selectedClass);
        return this.$el.trigger($.Event("select." + ns, {
          content: content
        })).find(this.settings.toggleSelector).text(content);
      };

      return Dropdown;

    })();
    $.fn[pluginName] = function(options) {
      return this.each(function() {
        var d;
        if (!$.data(this, ns)) {
          d = new Dropdown(this, options);
          instances.push(this);
          return $.data(this, ns, d);
        }
      });
    };
  };

  (function(factory) {
    if (typeof define === 'function' && define.amd) {
      return define(['jquery'], factory);
    } else {
      return factory(jQuery);
    }
  })(factory);

}).call(this);
