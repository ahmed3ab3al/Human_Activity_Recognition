abstract class ApiHelper {
  Future<dynamic> get(String url,
      {Object? data, Map<String, dynamic>? queryParameters});

  Future<dynamic> post(String url,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false});

  Future<dynamic> put(String url,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false});

  Future<dynamic> delete(String url,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false});

  Future<dynamic> patch(String url,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false});
}
