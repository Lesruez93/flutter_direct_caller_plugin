# flutter_direct_caller_plugin

A lightweight plugin that enables direct calls from the app without opening the phone dialer. It seamlessly handles permission requests for a smooth user experience.
## Usage

```
flutter pub add flutter_direct_caller_plugin
```

Add dependency to pubspec.yaml file
```
flutter_direct_caller_plugin: 0.0.2
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
import 'package:flutter_direct_caller_plugin/flutter_direct_caller_plugin.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _numberCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _numberCtrl.text = "+263775658123";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Direct Caller Plugin example app'),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _numberCtrl,
                decoration: const InputDecoration(labelText: "Phone Number"),
                keyboardType: TextInputType.number,
              ),
            ),
            ElevatedButton(
              child: const Text("Call"),
              onPressed: () async {
                FlutterDirectCallerPlugin.callNumber(_numberCtrl.text);
              },
            )
          ],
        ),
      ),
    );
  }
}

```

