import 'package:dio/dio.dart';
import 'package:jsonpleasholder_r/models/post_model.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com')
abstract class ApiService{
  factory ApiService(Dio dio,{String baseUrl})=_ApiService;
  @GET('/posts')
  Future<List<PostModel>> getPosts();
}

