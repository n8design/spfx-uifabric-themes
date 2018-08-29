# How to use CSS Variables in SPFx projects

To use CSS variable in your next project simply install this package as a dependency.

```js
npm install spfx-uifabric-themes --save
```

On your project in the web part code or extension code import the dependency.

```js
import styles from './HelloWorldWebPart.module.scss';
import * as strings from 'HelloWorldWebPartStrings';

// ⌄⌄⌄⌄ import dependency here ⌄⌄⌄⌄
import uiFabricCSSVariables from 'spfx-uifabric-themes';

```

Somewhere in the render method call the `uiFabricCSSVariable()` methode.

```js
export default class HelloWorldWebPart extends BaseClientSideWebPart<IHelloWorldWebPartProps> {

  public render(): void {

    uiFabricCSSVariables();

    this.domElement.innerHTML = `
      <div class="${ styles.helloWorld}">
        <div class="${ styles.container}">
          <div class="${ styles.row}">
            <div class="${ styles.column}">
            ...
            `
```

The call of the function will convert all theme slots into native CSS Variable and are available for the use in your CSS. If multiple web parts are registered on the page this conversion will be only made once to optimise the performance.

In CSS simply reference to the theme slot variables.

```css
.row {
  @include ms-Grid-row;
  color: var(--ouif-white); // use theme color set to white
  background-color: var(--ouif-themeDark); // use color defined for themeDark.
  padding: 20px;
}
```

The result on the web part is exactly the same as using the SASS variables.

![cSS Variables](../assets/css-variables-web-part.png)

Further reading on [CSS Variables support for SPFx projects through spfx-uifabric-themes](https://wp.me/p2iCnX-14x)

## Available CSS Variables

```css
:root{
--ouif-AccentLines: #0086f4;
--ouif-AccentText: #0078d7;
--ouif-BackgroundOverlay: rgba(255, 255, 255, 0.85);
--ouif-BodyText: #333333;
--ouif-ButtonBackground: #f8f8f8;
--ouif-ButtonBorder: #a6a6a6;
--ouif-ButtonDisabledBackground: #f8f8f8;
--ouif-ButtonDisabledBorder: #eaeaea;
--ouif-ButtonDisabledText: #a6a6a6;
--ouif-ButtonGlyph: #666666;
--ouif-ButtonGlyphActive: #333333;
--ouif-ButtonGlyphDisabled: #c8c8c8;
--ouif-ButtonHoverBackground: #e1f2ff;
--ouif-ButtonHoverBorder: #c4e4ff;
--ouif-ButtonPressedBackground: #c4e4ff;
--ouif-ButtonPressedBorder: #0086f4;
--ouif-ButtonText: #333333;
--ouif-CommandLinks: #666666;
--ouif-CommandLinksDisabled: #a6a6a6;
--ouif-CommandLinksHover: #0078d7;
--ouif-CommandLinksPressed: #004176;
--ouif-CommandLinksSecondary: #212121;
--ouif-ContentAccent1: #0078d7;
--ouif-DialogBorder: #f4f4f4;
--ouif-DisabledBackground: #f8f8f8;
--ouif-DisabledLines: #eaeaea;
--ouif-DisabledText: #a6a6a6;
--ouif-EmphasisBackground: #0078d7;
--ouif-EmphasisBorder: #005296;
--ouif-EmphasisHoverBackground: #005296;
--ouif-EmphasisHoverBorder: #004176;
--ouif-EmphasisText: #ffffff;
--ouif-FooterBackground: rgba(255, 255, 255, 0.85);
--ouif-HeaderAccentLines: #0086f4;
--ouif-HeaderBackground: rgba(255, 255, 255, 0.85);
--ouif-HeaderDisableText: #a6a6a6;
--ouif-HeaderDisabledBackground: #f8f8f8;
--ouif-HeaderDisabledLines: #eaeaea;
--ouif-HeaderLines: #a6a6a6;
--ouif-HeaderNavigationHoverText: #0078d7;
--ouif-HeaderNavigationPressedText: #004176;
--ouif-HeaderNavigationSelectedText: #0078d7;
--ouif-HeaderNavigationText: #666666;
--ouif-HeaderSiteTitle: #212121;
--ouif-HeaderStrongLines: #c4e4ff;
--ouif-HeaderSubtleLines: #c8c8c8;
--ouif-HeaderText: #333333;
--ouif-HoverBackground: rgba(225, 242, 255, 0.50);
--ouif-Hyperlink: #0078d7;
--ouif-HyperlinkActive: #004176;
--ouif-Hyperlinkfollowed: #004176;
--ouif-Lines: #a6a6a6;
--ouif-Navigation: #666666;
--ouif-NavigationAccent: #0078d7;
--ouif-NavigationHover: #0078d7;
--ouif-NavigationHoverBackground: rgba(225, 242, 255, 0.50);
--ouif-NavigationPressed: #004176;
--ouif-NavigationSelectedBackground: rgba(234, 234, 234, 0.78);
--ouif-PageBackground: #ffffff;
--ouif-RowAccent: #0078d7;
--ouif-SelectionBackground: rgba(196, 228, 255, 0.50);
--ouif-SiteTitle: #212121;
--ouif-StrongBodyText: #212121;
--ouif-StrongLines: #c4e4ff;
--ouif-SubtleEmphasisBackground: #f4f4f4;
--ouif-SubtleEmphasisCommandLinks: #212121;
--ouif-SubtleEmphasisText: #666666;
--ouif-SubtleLines: #c8c8c8;
--ouif-SuiteBarBackground: #0078d7;
--ouif-SuiteBarHoverBackground: #83c7ff;
--ouif-SuiteBarHoverText: #c4e4ff;
--ouif-SuiteBarText: #ffffff;
--ouif-TileBackgroundOverlay: rgba(0, 0, 0, 0.50);
--ouif-TileText: #ffffff;
--ouif-TopBarBackground: rgba(234, 234, 234, 0.78);
--ouif-TopBarHoverText: #333333;
--ouif-TopBarPressedText: #004176;
--ouif-TopBarText: #666666;
--ouif-WebPartHeading: #333333;
--ouif-accent: #8764b8;
--ouif-backgroundImageUri: none;
--ouif-backgroundOverlay: rgba(255, 255, 255, 0.85);
--ouif-black: #000000;
--ouif-blackTranslucent40: rgba(0,0,0,.4);
--ouif-blockingBackground: rgba(234, 67, 0, .2);
--ouif-blue: #0078d4;
--ouif-blueDark: #002050;
--ouif-blueLight: #00bcf2;
--ouif-blueMid: #00188f;
--ouif-bodyBackground: #ffffff;
--ouif-bodyDivider: #c8c8c8;
--ouif-bodyFrameBackground: #ffffff;
--ouif-bodyFrameDivider: #eaeaea;
--ouif-bodySubtext: #666666;
--ouif-bodyText: #333333;
--ouif-bodyTextChecked: #000000;
--ouif-buttonBackground: #f4f4f4;
--ouif-buttonBackgroundChecked: #c8c8c8;
--ouif-buttonBackgroundCheckedHovered: #eaeaea;
--ouif-buttonBackgroundHovered: #eaeaea;
--ouif-buttonBorder: transparent;
--ouif-buttonText: #333333;
--ouif-buttonTextChecked: #212121;
--ouif-buttonTextCheckedHovered: #000000;
--ouif-buttonTextHovered: #000000;
--ouif-dialogBorder: #f4f4f4;
--ouif-disabledBackground: #f4f4f4;
--ouif-disabledBodyText: #c8c8c8;
--ouif-disabledSubtext: #d0d0d0;
--ouif-disabledText: #a6a6a6;
--ouif-errorBackground: rgba(232, 17, 35, .2);
--ouif-errorText: #a80000;
--ouif-focusBorder: #000000;
--ouif-green: #107c10;
--ouif-greenDark: #004b1c;
--ouif-greenLight: #bad80a;
--ouif-inputBackground: #ffffff;
--ouif-inputBackgroundChecked: #0078d7;
--ouif-inputBackgroundCheckedHovered: #006ac1;
--ouif-inputBorder: #a6a6a6;
--ouif-inputBorderHovered: #212121;
--ouif-inputFocusBorderAlt: #0078d7;
--ouif-inputForegroundChecked: #ffffff;
--ouif-inputPlaceholderText: #666666;
--ouif-link: #0078d7;
--ouif-linkHovered: #004176;
--ouif-listBackground: #ffffff;
--ouif-listHeaderBackgroundHovered: #f4f4f4;
--ouif-listHeaderBackgroundPressed: #eaeaea;
--ouif-listItemBackgroundChecked: #eaeaea;
--ouif-listItemBackgroundCheckedHovered: #dadada;
--ouif-listItemBackgroundHovered: #f4f4f4;
--ouif-listText: #333333;
--ouif-listTextColor: #333333;
--ouif-magenta: #b4009e;
--ouif-magentaDark: #5c005c;
--ouif-magentaLight: #e3008c;
--ouif-menuHeader: #0078d7;
--ouif-menuIcon: #0078d7;
--ouif-menuItemBackgroundChecked: #eaeaea;
--ouif-menuItemBackgroundHovered: #f4f4f4;
--ouif-neutralDark: #212121;
--ouif-neutralLight: #eaeaea;
--ouif-neutralLighter: #f4f4f4;
--ouif-neutralLighterAlt: #f8f8f8;
--ouif-neutralPrimary: #333333;
--ouif-neutralPrimaryAlt: #3c3c3c;
--ouif-neutralQuaternary: #d0d0d0;
--ouif-neutralQuaternaryAlt: #dadada;
--ouif-neutralSecondary: #666666;
--ouif-neutralTertiary: #a6a6a6;
--ouif-neutralTertiaryAlt: #c8c8c8;
--ouif-orange: #d83b01;
--ouif-orangeLight: #ea4300;
--ouif-orangeLighter: #ff8c00;
--ouif-primaryBackground: #ffffff;
--ouif-primaryText: #333333;
--ouif-purple: #5c2d91;
--ouif-purpleDark: #32145a;
--ouif-purpleLight: #b4a0ff;
--ouif-red: #e81123;
--ouif-redDark: #a80000;
--ouif-smallInputBorder: #666666;
--ouif-successBackground: rgba(186, 216, 10, .2);
--ouif-suiteBarBackground: #0078d7;
--ouif-suiteBarText: #ffffff;
--ouif-teal: #008272;
--ouif-tealDark: #004b50;
--ouif-tealLight: #00b294;
--ouif-themeAccent: #0078d7;
--ouif-themeAccentTranslucent10: rgba(0, 120, 215, 0.10);
--ouif-themeDark: #005296;
--ouif-themeDarkAlt: #006ac1;
--ouif-themeDarker: #004176;
--ouif-themeLight: #c4e4ff;
--ouif-themeLightAlt: #89cbff;
--ouif-themeLighter: #e1f2ff;
--ouif-themeLighterAlt: #f0f8ff;
--ouif-themePrimary: #0078d7;
--ouif-themeSecondary: #0086f4;
--ouif-themeTertiary: #83c7ff;
--ouif-themeTertiaryAlt: #89cbff;
--ouif-topBarBackground: rgba(234, 234, 234, 0.78);
--ouif-topBarHoverText: #333333;
--ouif-topBarText: #666666;
--ouif-warningBackground: rgba(255, 185, 0, .2);
--ouif-warningHighlight: #ffb900;
--ouif-warningText: #333333;
--ouif-white: #ffffff;
--ouif-whiteTranslucent40: rgba(255, 255, 255, 0.40);
--ouif-yellow: #ffb900;
--ouif-yellowLight: #fff100;
}
```

