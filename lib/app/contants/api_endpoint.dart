class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  // static const String baseUrl = 'http://192.168.1.133:5000/api/';
  static const String baseUrl = "http://10.0.2.2:5000/api/";

  // ====================== Auth Routes ======================
  static const String loginUser = "user/login";
  static const String registerUser = "user/create";

// ============Property Routes ==========
  static const String getAllProperty = 'property/get_all_property';
  static const String updateProperty = 'property/update_property';

  static const String paginationProperty = 'property/pagination';
  static const int limitPage = 2;

  // static const String imageUrl = 'http://192.168.1.133:5000/property/'
  static const String imageUrl = 'http://10.0.2.2:5000/property/';
}
