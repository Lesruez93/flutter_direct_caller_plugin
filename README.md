# flutter_direct_caller_plugin

A lightweight plugin that enables direct calls from the app without opening the phone dialer. It seamlessly handles permission requests for a smooth user experience.
## Usage

Add dependency to pubspec.yaml file
```
flutter_direct_caller_plugin: 0.0.1
```

### Android
No need any additional configuration.

### iOS
Add this to your ```info.plist``` under ```dict```
```
<key>LSApplicationQueriesSchemes</key>
<array>
  <string>tel</string>
</array>
```

## Example

```dart
import 'package:flutter/material.dart';
import 'package:zw.co.lester.direct.caller.plus.flutter_direct_caller_plugin';

void main() {
  runApp(Scaffold(bvc
    body: Center(
      child: ElevatedButton(
        onPressed: _callNumber,
        child: Text('Call Number'),
      ),
    ),
  ));
}

_callNumber() async{
  const number = '+263775658123'; //set the number here
  bool res = await FlutterDirectCallerPlugin.callNumber(number);
}
```

