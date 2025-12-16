# timezone_provider

A Flutter plugin to get the device's IANA timezone name.

## Motivation

Dart's `DateTime.now().timeZoneName` returns timezone abbreviations like `"JST"` or `"EST"`, not IANA timezone identifiers. However, IANA timezone names (e.g., `Asia/Tokyo`, `America/New_York`) are often required for:

- Server-side analytics and logging
- Database storage with proper timezone handling
- Scheduling and calendar applications
- Any system that needs unambiguous timezone identification

### Why not other packages?

- **[flutter_native_timezone](https://pub.dev/packages/flutter_native_timezone)**: A well-designed package, but it has not been updated for a long time and has unresolved issues.
- **[timezone](https://pub.dev/packages/timezone)**: Provides timezone database and calculations, but cannot retrieve the device's local timezone identifier.

This plugin provides a simple, maintained solution for accessing the device's IANA timezone identifier from native platform APIs.

## Installation

```yaml
dependencies:
  timezone_provider: ^0.0.1
```

## Usage

```dart
import 'package:timezone_provider/timezone_provider.dart';

final provider = TimezoneProvider();
final timezone = await provider.getTimezone();
print(timezone); // "Asia/Tokyo"
```

## Platform Implementation

| Platform | Implementation |
|----------|----------------|
| iOS | `TimeZone.current.identifier` |
| Android | `TimeZone.getDefault().id` |
