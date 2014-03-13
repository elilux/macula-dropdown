# Macula Dropdown

Macula Dropdown is a jQuery plugin that provides a dropdown select UI component.

## Install

You can include Macula Dropdown in your project via [bower](http://bower.io/)

```bash
bower install macula-dropdown
```

Or download and build the source yourself

```bash
git clone isocket/macula-dropdown && npm install && grunt
```

## Use

This plugin can be registered with AMD or instantiated as a global.


It expects this HTML by default, but you can customize with options below:

```html
<div class="m-dropdown">
  <button type="button" class="btn m-dropdown--toggle">Dropdown</button>

  <ul class="m-dropdown--menu">
    <li>
      <a href="#">Item 1</a>
    </li>
    <li>
      <a href="#">Item 2</a>
    </li>
    <li class="divider">
      <a href="#">Item 3 with divider</a>
    </li>
    </ul>
</div>
```

Using is as simple as:

```javascript
$('.m-dropdown').mDropdown()
```

### Options

#### toggleSelector

Type: `String`
Default: `.m-dropdown--toggle`

Selector for what you click to open the dropdown. Think of it like a `<select>`

#### menuSelector

Type: `String`
Default: `.m-dropdown--menu li`

Selector for the dropdown items. Think of it like an `<option>`

#### selectedClass

Type: `String`
Default: `is-selected`

---

Example usage with options:

```javascript
$('.my-dropdown').mDropdown({
  toggleSelector: '.my-dropdown-select'
  menuSelector: '.my-dropdown-item'
  selectedClass: 'now-selected'
})
```

### Events

#### select.macula.mDropdown

This event fires immediately when a menu item is selected. The `mDropdown` data attribute or the text will be available as the `content` property of the event

```html
<ul class="m-dropdown--menu">
  <li data-m-dropdown="custom">Item 1</li>
  ...
</ul>
```

```javascript
$('.m-dropdown').mDropdown().on('select.macula.mDropdown', function(e) {
  console.log(e.content)
})
```
Triggering a `click` on that `li` will result in `custom` being logged to your console.
