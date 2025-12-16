import 'package:flutter_test/flutter_test.dart';
import 'package:timezone_provider/timezone_provider.dart';
import 'package:timezone_provider/timezone_provider_platform_interface.dart';
import 'package:timezone_provider/timezone_provider_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockTimezoneProviderPlatform
    with MockPlatformInterfaceMixin
    implements TimezoneProviderPlatform {
  @override
  Future<String> getTimezone() => Future.value('Asia/Tokyo');
}

void main() {
  final TimezoneProviderPlatform initialPlatform =
      TimezoneProviderPlatform.instance;

  test('$MethodChannelTimezoneProvider is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelTimezoneProvider>());
  });

  test('getTimezone', () async {
    TimezoneProvider timezoneProviderPlugin = TimezoneProvider();
    MockTimezoneProviderPlatform fakePlatform = MockTimezoneProviderPlatform();
    TimezoneProviderPlatform.instance = fakePlatform;

    expect(await timezoneProviderPlugin.getTimezone(), 'Asia/Tokyo');
  });
}
