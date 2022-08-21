# flutter_d10_networking_request

- data_service.dart
```dart
import 'package:http/http.dart' as http;

class DataService{
  Future<String> makeRequestToApi() async {
    //https://demo-v3-laravelapi.gzeinnumer.com/api/products/all
    final uri = Uri.https("demo-v3-laravelapi.gzeinnumer.com", "/api/products/all");
    final response = await http.get(uri);
    return response.body;
  }
}
```
- main.dart
```dart
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_d10_networking_request/data_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _dataService = DataService();
  var _response;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Builder(
            builder: (context) {
              if (_response != null) {
                return Text(_response,textAlign: TextAlign.center,);
              } else {
                return ElevatedButton(
                  child: const Text("Make Request"),
                  onPressed: _makeRequest,
                );
              }
            },
          ),
        ),
      ),
    );
  }

  void _makeRequest() async {
    String res = await _dataService.makeRequestToApi();
    setState(() {
      _response = res;
    });
  }
}
```

---

```
Copyright 2022 M. Fadli Zein
```