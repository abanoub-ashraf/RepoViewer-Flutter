import 'dart:io';

import 'package:dio/dio.dart';

///
/// we gonna check for this type of dio error of not having internet connection 
/// in many places so we put this here in an extensions and will use that getter 
/// in as many places as we want
///
extension DioErrorX on DioError {
    ///
    /// this will return true this condition happened
    ///
    bool get isNoConnectionError {
        return type == DioErrorType.other && error is SocketException;
    }
}