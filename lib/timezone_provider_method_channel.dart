import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'timezone_provider_platform_interface.dart';

class MethodChannelTimezoneProvider extends TimezoneProviderPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('timezone_provider');

  @override
  Future<String> getTimezone() async {
    final timezone = await methodChannel.invokeMethod<String>('getTimezone');
    return timezone!;
  }
}
