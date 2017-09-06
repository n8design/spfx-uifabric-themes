# Office UI Fabric and Office 365 Theme support for SharePoint Framework Projects
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

# License
MIT License

Copyright (c) 2017 [Stefan Bauer](https://www.twitter.com/stfbauer)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
