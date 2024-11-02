class GeneralErrorModel {
  int? statusCode;
  String? processStatus;
  String? processDate;
  String? messageCode;
  String? message;
  String? code;
  GeneralErrorModel(
      { this.statusCode,
      this.processStatus,
      this.processDate,
      this.messageCode,
      this.message});

  GeneralErrorModel.fromJson(dynamic json, this.statusCode) {
    if (json is Map<String, dynamic>) {
      processStatus = json['processStatus'];
      processDate = json['processDate'];
      messageCode = json['messageCode'];
      message = json['message'];
      statusCode = statusCode ?? json['statusCode'];
      message = json['code'];
    }
  }
}
