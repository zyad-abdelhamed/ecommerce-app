//input model for all api service methodes
class ApiServiceInputModel {
  final String url;
  final Map<String, dynamic>? body;
  final ApiHeadersEnum apiHeaders;
  final ApiContentTypeEnum apiContentType;
  ApiServiceInputModel(
      {this.apiContentType = ApiContentTypeEnum.applicationJson,
      required this.url,
      this.body,
      required this.apiHeaders});
}

enum ApiHeadersEnum {
  backEndHeadersWithoutToken,
  backEndHeadersWithToken,
  paymentHeaders
}

enum ApiContentTypeEnum { applicationJson, applicationXWwwFormUrlencoded }
