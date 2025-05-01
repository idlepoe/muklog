class ApiResponse<T> {
  final bool success;
  final String message;
  final T? data;

  ApiResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ApiResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Map<String, dynamic>) fromJsonT,
      ) {
    return ApiResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null ? fromJsonT(json['data']) : null,
    );
  }

  static ApiResponse<List<T>> fromJsonList<T>(
      Map<String, dynamic> json,
      T Function(Map<String, dynamic>) fromJson,
      ) {
    final rawList = json['data'] as List<dynamic>? ?? [];
    final parsedList = rawList.map((e) => fromJson(e as Map<String, dynamic>)).toList();

    return ApiResponse<List<T>>(
      success: json['success'] == true,
      message: json['message'] ?? '',
      data: parsedList,
    );
  }
}