import 'package:http/http.dart' as http;
import 'package:i_digitech/data/network_service/base_api_services.dart';
import 'package:i_digitech/data/network_service/network_api_services.dart';
import 'package:i_digitech/res/app_url.dart';

class ProductRepository{
  
  // Loosely Coupled
  final BaseApiServices _services = NetworkApiServices(http.Client());

  Future<dynamic> getProducts()async{
     try {
      final response = await _services.get(AppUrl.getProducts);
      if(response != null){
        return response;
      }
    } catch (e) {
      rethrow;
    }
  }

}