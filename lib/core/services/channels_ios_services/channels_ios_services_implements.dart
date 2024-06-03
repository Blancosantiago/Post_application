import 'package:challenge_application/core/services/channels_ios_services/channels_ios_services.dart';
import 'package:flutter/services.dart';

class ChannelsIosServicesImplements implements ChannelsIosServices {
  @override
  Future<T> getChannel<T>(String url, [Map<String, dynamic>? headers]) async {
    const platform =
        MethodChannel('com.example.challenge_application/getChannel');
    final result = await platform
        .invokeMethod('getChannel', {"url": url, "headers": headers});

    return result;
  }
}
