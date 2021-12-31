import 'package:code95_task/data/models/responses/user_responses_model.dart';
import 'package:code95_task/data/network/dio.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'public_apis.g.dart';

@RestApi(baseUrl: "https://mocki.io/v1/")
abstract class PublicApis {
  factory PublicApis(Dio dio) = _PublicApis;

  @GET('beaa1746-b297-4522-80aa-595a13a9f0cf')
  Future<UsersResponseModel> getUsers(
      );
}

final publicApis = PublicApis(publicDio);
