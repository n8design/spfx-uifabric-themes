# Typography
These functions can be used to create custom typography classes based on Office UI Fabric instead of using the default provided classes. These classes also provide `em` based font sizes and not fixed pixel based.

## uiFontSize($fontSizeValue)
Possible font size values that can be passed to this SASS mixin are:
3em, 2em, 1.5em, 1.21429em, 1.07143em, 1em, 0.92857em, 0.85714em, 0.78571em, 0.71429em

| $fontSizeParameter| Output font size | UI Fabric | UI Fabric size |
| ------------- | -----:| ------------- | ----:|
| su      | 3em | .ms-fontSize-su  | 42px |
| xxl     | 2em | .ms-fontSize-xxl | 28px |
| xl      | 1.5em | .ms-fontSize-xl  | 21px |
| l       | 1.21429em | .ms-fontSize-l | 17px |
| m-plus  | 1.07143em | .ms-fontSize-mPlus | 15px |
| m       | 1em | .ms-fontSize-m | 14px |
| s-plus  | 0.92857em | .ms-fontSize-sPlus | 13px |
| s       | 0.85714em | .ms-fontSize-s | 12px |
| xs      | 0.78571em | .ms-fontSize-xs | 11px |
| mi      | 0.71429em | .ms-fontSize-mi | 10px |

To use this mixin simply includes this style with and the parameter.

```sass
.mySuperLargeClass{
    @include uiFontSize(su); // Will return font-size 3em = 42px;
}
```

**Result in CSS**

```sass
.mySuperLargeClass{
    font-size: 3em // 3em at a base font size of 14px = 42px
}
```

***Result in SPFx Projects***

```sass
.mySuperLargeClass_714f5755{
    font-size: 3em // 3em at a base font size of 14px = 42px
}
```


