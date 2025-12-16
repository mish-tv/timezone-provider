import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:timezone_provider/timezone_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _timezone = 'Unknown';
  final _timezoneProvider = TimezoneProvider();

  @override
  void initState() {
    super.initState();
    _loadTimezone();
  }

  Future<void> _loadTimezone() async {
    String timezone;
    try {
      timezone = await _timezoneProvider.getTimezone();
    } on PlatformException {
      timezone = 'Failed to get timezone.';
    }

    if (!mounted) return;

    setState(() {
      _timezone = timezone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Timezone Provider Example'),
        ),
        body: Center(
          child: Text('Timezone: $_timezone'),
        ),
      ),
    );
  }
}
