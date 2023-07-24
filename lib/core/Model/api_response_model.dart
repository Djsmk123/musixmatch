import 'package:equatable/equatable.dart';

class ApiResponseModel extends Equatable {
  final APIMessageModel message;
  const ApiResponseModel({required this.message});
  factory ApiResponseModel.fromJson(Map<String, dynamic> json) {
    return ApiResponseModel(message: APIMessageModel.fromJson(json['message']));
  }

  Map<String, dynamic> toJson() {
    return {'message': message.toJson()};
  }

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class APIMessageModel extends Equatable {
  final APIResponseHeaderModel header;
  final dynamic body;

  const APIMessageModel({required this.header, this.body});
  factory APIMessageModel.fromJson(Map<String, dynamic> json) {
    return APIMessageModel(
        header: APIResponseHeaderModel.fromJson(json['header']),
        body: json['body']);
  }
  Map<String, dynamic> toJson() {
    return {'header': header.toJson(), 'body': body};
  }

  @override
  // TODO: implement props
  List<Object?> get props => [header, body];
}

class APIResponseHeaderModel extends Equatable {
  final int statusCode;
  final double executeTime;

  const APIResponseHeaderModel(this.statusCode, this.executeTime);
  factory APIResponseHeaderModel.fromJson(Map<String, dynamic> json) {
    return APIResponseHeaderModel(
        json['status_code'], (json['execute_time'] as num).toDouble());
  }
  Map<String, dynamic> toJson() {
    return {'status_code': statusCode, 'execute_time': executeTime};
  }

  @override
  // TODO: implement props
  List<Object?> get props => [statusCode, executeTime];
}
