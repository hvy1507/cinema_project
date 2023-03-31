// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse _$ApiResponseFromJson(Response response) {
  if(200<=response.statusCode!&&response.statusCode!<=299) {
    return ApiResponse(
    code: response.statusCode??0,
    data: response.data,
    message: response.data["message"].toString()??"",
    result: true,
    totalItem: 0,
    totalItemRespondent: 0
  );
  } else {
    return ApiResponse(
    code: response.statusCode??0,
    data: response.data,
    message: response.data["message"],
    result: false,
    totalItem: 0,
    totalItemRespondent: 0
  );
  }
}

Map<String, dynamic> _$ApiResponseToJson(ApiResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'message': instance.message,
      'result': instance.result,
      'totalItem': instance.totalItem,
      'totalItemRespondent': instance.totalItemRespondent,
    };