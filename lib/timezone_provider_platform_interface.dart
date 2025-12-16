import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'timezone_provider_method_channel.dart';

abstract class TimezoneProviderPlatform extends PlatformInterface {
  TimezoneProviderPlatform() : super(token: _token);

  static final Object _token = Object();

  static TimezoneProviderPlatform _instance = MethodChannelTimezoneProvider();

  static TimezoneProviderPlatform get instance => _instance;

  static set instance(TimezoneProviderPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String> getTimezone() {
    throw UnimplementedError('getTimezone() has not been implemented.');
  }
}
