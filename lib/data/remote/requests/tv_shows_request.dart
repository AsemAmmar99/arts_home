import 'package:arts_home/core/constants_methods.dart';
import 'package:arts_home/core/end_points.dart';
import 'package:arts_home/data/remote/data_providers/my_dio.dart';
import 'package:arts_home/data/remote/responses/tv_shows_response.dart';
import 'package:dio/dio.dart';

class TvShowsRequest{
  Future tvShowsRequest({
  required String apiKey
}) async{
    try{
      Response response = await MyDio.getData(
          endPoint: popularTVShows,
          query: {
            'api_key': apiKey,
          }
      );
      printTest('tvShowsRequestStatusCode ${response.statusCode}');
      printResponse('tvShowsResponse ${response.data}');
      return TvShowsResponse.fromJson(response.data);
    }catch(error){
      printError('tvShowsRequest $error');
    }
  }
}