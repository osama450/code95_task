
import 'package:code95_task/data/network/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'private_apis.g.dart';

@RestApi(baseUrl: "http://promoting.joe13th.com:8080/")
abstract class PrivateApis {
  factory PrivateApis(Dio dio) = _PrivateApis;

}

final privateApis = PrivateApis(privateDio);
