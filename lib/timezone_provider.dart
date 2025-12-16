import 'timezone_provider_platform_interface.dart';

class TimezoneProvider {
  Future<String> getTimezone() {
    return TimezoneProviderPlatform.instance.getTimezone();
  }
}
