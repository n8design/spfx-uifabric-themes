[![Build Status](https://travis-ci.org/StfBauer/spfx-uifabric-themes.svg?branch=master)](https://travis-ci.org/StfBauer/spfx-uifabric-themes.svg) [![Greenkeeper badge](https://badges.greenkeeper.io/StfBauer/spfx-uifabric-themes.svg)](https://greenkeeper.io/)


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
// For all tools and utlities
@import './node_modules/spfx-uifabric-themes/office.theme';
```

If only the color variables are needed in the SPFX Project only the variables can be included too.

```scss
// For color variables only
@import './node_modules/spfx-uifabric-themes/office.theme.vars';
```

After that you can use theme slots like `$ms-themePrimary`.

```scss
@import './node_modules/spfx-uifabric-themes/office.theme';

.container {
  background-color: $ms-themePrimary;
}
// For Error Messages use you can pass: alert, error, info, servere, success
.custErrorMsg{
  padding: 0 1em;
  line-height: 2em;
  @include stateStyle('error');
}

```

This will automatically add the theme slot for the background color.

```css

.container_742604fa {
  background-color: "[theme:themePrimary, default:#0078d7]"
}

.custErrorMsg_742604fa {
  padding: 0 1em;
  line-height: 2em;
  background-color: "[theme:errorBackground, default: #fde7e9]";
  color: "[theme:errorText, default: #333333]"
}
```

# Additional functions
You will find all additional functions in the documentation:

* [Typopgraphy](./docs/typography.md)  
Create font-weight, font-styles and general text styles
* [State styles](./docs/statestyles.md)  
Creates alert, error, info, server and success styles

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


[office.theme.functions.statestyle]: ./assets/office.theme.functions.statestyle.png "Possible stateStyle results"