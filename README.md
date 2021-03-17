# Flutter Glow package

[![Header](https://raw.githubusercontent.com/payam-zahedi/flutter-glow/master/res/images/Header.png "Header")](https://raw.githubusercontent.com/payam-zahedi/flutter-glow/master/res/images/Header.png "Header")

##### complete and easy to use flutter glow ui kit that help you to create and use glow widgets.

## installation
for install this package add package to your pubspec.yaml file:
```yaml
dependencies:
  flutter_glow: ^0.2.0
```
run `flutter pub get` to download package. also, import the package in your file:
```dart
import 'package:flutter_glow/flutter_glow.dart';
```
## Widgets
<table>
<thead>
<tr>
<th>Preview</th>
<th>Widget</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
  <td><img src="https://github.com/payam-zahedi/flutter-glow/blob/master/res/images/components/button.png?raw=true"/></td>
  <td>GlowButton</td>
  <td>A Glow button that show inkwell animation to intracting with user</td>
</tr>
<tr>
  <td><img src="https://github.com/payam-zahedi/flutter-glow/blob/master/res/images/components/icon.png?raw=true"/></td>
  <td>GlowIcon</td>
  <td>A Glow widget that is responsible for show icon with glow effect</td>
</tr>
<tr>
  <td><img src="https://github.com/payam-zahedi/flutter-glow/blob/master/res/images/components/text.png?raw=true"/></td>
  <td>GlowText</td>
  <td> Glow text is used to show glow under the text</td>
</tr>
<tr>
  <td><img src="https://github.com/payam-zahedi/flutter-glow/blob/master/res/images/components/checkbox.png?raw=true"/> </td>
  <td>GlowCheckbox</td>
  <td>A button associated with a value, can be checked/unckecked, if checked, takes the color value
  </td>
</tr>
<tr>
  <td><img src="https://github.com/payam-zahedi/flutter-glow/blob/master/res/images/components/radio.png?raw=true"/></td>
  <td>GlowRadio</td>
  <td>A set of glow radio component with single selection at time.</td>
</tr>
<tr>
  <td><img src="https://github.com/payam-zahedi/flutter-glow/blob/master/res/images/components/switch.png?raw=true"/></td>
  <td>GlowSwitch </td>
  <td>Glow is an cupertino switch that integrated with GlowContainer to show glow under Switch</td>
</tr>
</tbody>
</table>

## Glow Theme
you can create your own GlowTheme. Since GlowTheme is an InheritedWidget you can use it to Handle 
whole app changes or use it for tiny scope.

