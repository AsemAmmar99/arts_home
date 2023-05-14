import 'package:arts_home/core/constants_methods.dart';
import 'package:arts_home/core/end_points.dart';
import 'package:arts_home/data/remote/data_providers/my_dio.dart';
import 'package:arts_home/data/remote/responses/stars_response.dart';
import 'package:dio/dio.dart';

class StarsRequest{
  Future starsRequest({
  required String apiKey
}) async{
    try{
      Response response = await MyDio.getData(
          endPoint: popularPersons,
          query: {
            'api_key': apiKey,
          }
      );
      printTest('starsRequestStatusCode ${response.statusCode}');
      printResponse('starsResponse ${response.data}');
      return StarsResponse.fromJson(response.data);
    }catch(error){
      printError('starsRequest $error');
    }
  }
}