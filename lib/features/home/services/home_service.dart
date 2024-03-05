import 'package:i_digitech/data/response.dart';
import 'package:i_digitech/repository/product_repository.dart';

class HomeService {
  final ProductRepository _feedRepository = ProductRepository();

  Future<ApiResponse> getProducts() async {
    try {
      final response = await _feedRepository.getProducts();
      if (response != null) {
        return ApiResponse(true, response, 'Succesfully get the ARticles');
      }
      return ApiResponse(false, null, 'Error');
    } catch (e) {
      return ApiResponse(false, null, 'Error');
    }
  }
}
