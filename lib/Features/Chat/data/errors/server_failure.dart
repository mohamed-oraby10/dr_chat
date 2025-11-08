
import 'package:dio/dio.dart';
import 'package:new_dr_chat_application/core/errors/failure.dart';

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: 'Connection timeOut with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errMessage: 'Send timeOut with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: 'Receive timeOut with ApiServer');

      case DioExceptionType.badCertificate:
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response!.statusCode!,
          dioError.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure(errMessage: 'Request to ApiServer was canceld');

      case DioExceptionType.connectionError:
       return ServerFailure(
            errMessage: 'No internet connection, please try later!',
          );
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure(
            errMessage: 'No internet connection, please try later!',
          );
        }
        return ServerFailure(errMessage: 'Unexpected error, please try again!');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errMessage: response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(
        errMessage: 'Your request not found, please try later!',
      );
    } else if (statusCode == 500) {
      return ServerFailure(
        errMessage: 'Internal server error, please try again!',
      );
    } else {
      return ServerFailure(
        errMessage: 'Opps there was an error, please try again',
      );
    }
  }
}
