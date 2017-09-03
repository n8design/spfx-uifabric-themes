# Office UI Fabrich and Office 365 Theme support for SharePoint Framework Projects
This NPM package allows you to use theme token from Office UI Frabric in SharPoint Framework Projects.

# Installation
Create a new SharePoint Framework Project and add this package to your project.

```bash
npm install --save-dev spfx-uifabric-themes 
```

After this installation this package should be listed as a dev dependency in your SPFX Project.

# Usage
Go to any of your `.module.scss` files in your project and include the following SASS @import statement 

```scss
@import './node_modules/spfx-uifabric-themes/office.theme.vars';
```

After that you can use theme slots like `$ms-themePrimary`.

```scss
@import './node_modules/spfx-uifabric-themes/office.theme.vars';

.container {
  background-color: $ms-themePrimary;
}

```

This will automatically add the theme slot for the background color.

```css

.container_742604fa {
  background-color: "[theme:themePrimary, default:#0078d7]"
}
```

