import 'dart:typed_data';

import 'package:http/http.dart';

typedef ResponseInterpreterCallback = Uint8List Function(Response response);

/// Options to configure the [LiveConfigurationClient]
class LiveConfigurationOptions {
  static ResponseInterpreterCallback defaultResponseInterpreter =
      (response) => response.bodyBytes;

  /// The endpoint where to connect in order to download configuration settings
  final String connectionEndpoint;

  /// The time to live of the cache before fetching from server again.
  /// Defaults to 6 hours.
  final Duration cacheTtl;

  /// A custom function used to interpret the response of the remote server while fetching.
  /// It defaults to return the [Response.bodyBytes] property.
  final ResponseInterpreterCallback? responseInterpreter;

  /// [connectionEndpoint] The endpoint where to connect in order to download configuration settings
  /// [cacheTtl] The time to live of the cache before fetching from server again
  LiveConfigurationOptions(
      {required this.connectionEndpoint,
      this.cacheTtl = const Duration(hours: 6),
      this.responseInterpreter});
}
