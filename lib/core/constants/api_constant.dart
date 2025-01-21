class ApiConstant {
  static const String baseUrl = 'https://student.valuxapps.com/api/';
  static const String registerEndPoint = '${baseUrl}register';
  static const String loginEndPoint = '${baseUrl}login';
  static const String getBannerEndPoint = '${baseUrl}banners';
  static const String getproductsEndPoint = '${baseUrl}products?category_id=';
  static const String favoritesEndPoint = "${baseUrl}favorites";
  static const String categoriesEndPoint = "${baseUrl}categories";
  static const String cartsEndPoint = "${baseUrl}carts";
  static const String getUserDataEndpoint = '${baseUrl}profile';
  static const String logOutEndpoint = '${baseUrl}logout';
  static const String changePasswordEndpoint = '${baseUrl}change-password';

  static String token = '';
  static const String stripeSecretKey = 'sk_test_51QjRIfCmjutEmYkFNQZQI2oRizE7HOgSdMOvxy0ITrEeSDkU0GQuAdobJ7StMbBb2NvgLcZ2B4Z2oQGIBayQyDqn00cmDlac28';
}
