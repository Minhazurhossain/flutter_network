import "dart:async";
import 'package:chopper/chopper.dart';

part "chopper_service.chopper.dart"; // Ensures this file matches the generated file name.

@ChopperApi(baseUrl: '/posts') // Base URL for API calls
abstract class UChopperService extends ChopperService {
  // Define your GET request
  @Get()
  Future<Response<List>> fetchPosts();

  // Factory method to create the service
  static UChopperService create() {
    final client = ChopperClient(
      baseUrl: Uri.parse('https://jsonplaceholder.typicode.com'),
      services: [_$UChopperService()], // Ensure correct generated class name
      converter: JsonConverter(),
      interceptors: [
        // Request interceptor
        @override
        (Request request) async {
          print('Request: ${request.method} ${request.url}');
          return request.copyWith(
            headers: {'Custom-Header': 'ChopperPackage'}, // Custom headers
          );
        },
        // Response interceptor
        (Response response) async {
          print('Response: ${response.body}');
          return response;
        },
      ],
    );
    return _$UChopperService(client); // Return the generated implementation
  }
}



