# State styles
The following method will help to create state styles.

## stateStyle($state) 
This functions returns the matching Office UI Fabric colors for the following states

* alert
* error
* info
* servere
* success

To use this function simplay pass in the string values.

```scss
// For Error Messages use you can pass: alert, error, info, servere, success
.custErrorMsg{
  padding: 0 1em;
  line-height: 2em;
  @include stateStyle('error');
}
```
This function can create the following status fields for example:
![stateStyle Sample Results][office.theme.functions.statestyle]
