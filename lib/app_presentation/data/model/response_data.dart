class ResponseData{
  final bool isSuccess;
  final int statusCode;
  final dynamic responseData;
  final String message;

  ResponseData({
      this.isSuccess = true,
      required this.statusCode,
      required this.responseData,
      this.message = 'Something went wrong'});
}