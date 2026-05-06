import 'dart:developer';
import 'package:dio/dio.dart';

class ApiErrorHandler {
  ApiErrorHandler._();

  static String extract(DioException e) {
    final data = e.response?.data;

    log('Status Code: ${e.response?.statusCode}');
    log('Error Response Data: $data');

    if (data == null) {
      return e.message ?? 'Something went wrong';
    }

    if (data is String) {
      return data;
    }

    if (data is Map<String, dynamic>) {
      final errors = data['errors'];

      if (errors is Map<String, dynamic>) {
        final messages = <String>[];

        errors.forEach((key, value) {
          if (value is List) {
            for (final item in value) {
              messages.add('$key: $item');
            }
          } else {
            messages.add('$key: $value');
          }
        });

        if (messages.isNotEmpty) {
          return messages.join('\n');
        }
      }

      if (errors is List) {
        return errors.join('\n');
      }

      return data['message']?.toString() ??
          data['error']?.toString() ??
          data['title']?.toString() ??
          data['detail']?.toString() ??
          data.toString();
    }

    return e.message ?? 'Something went wrong';
  }
}