(function() {
  var factory;

  factory = function($) {
    var Dropdown, closeAll, defaults, instances, namespace, pluginName;
    namespace = 'macula';
    pluginName = 'mDropdown';
    instances = [];
    defaults = {
      toggleSelector: '.m-dropdown--toggle',
      menuSelector: '.m-dropdown--menu li'
    };
    closeAll = function() {
      return $(instances).removeClass('is-open');
    };
    $(document).on("click." + namespace + "." + pluginName, closeAll);
    Dropdown = (function() {
      function Dropdown(element, options) {
        this.element = element;
        this.settings = $.extend({}, defaults, options);
        $(this.element).on("click." + namespace + "." + pluginName, this.toggle).on("click." + namespace + "." + pluginName, this.settings.menuSelector, (function(_this) {
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
        return $(this.element).find(this.settings.toggleSelector).text($(evt.currentTarget).text().trim());
      };

      return Dropdown;

    })();
    return $.fn[pluginName] = function(options) {
      return this.each(function() {
        var d;
        if (!$.data(this, "" + namespace + "." + pluginName)) {
          d = new Dropdown(this, options);
          instances.push(this);
          return $.data(this, "" + namespace + "." + pluginName, d);
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
