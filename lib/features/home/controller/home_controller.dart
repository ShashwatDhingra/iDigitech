import 'package:get/get.dart';
import 'package:i_digitech/features/home/services/home_service.dart';
import 'package:i_digitech/model/products_model.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  final HomeService _homeService = HomeService();
  Rx<ProductsModel?> products = Rx(null);

  void toggleLoading(bool value) {
    isLoading.value = value;
  }

  Future<void> getProducts() async {
    toggleLoading(true);

    final response = await _homeService.getProducts();

    if (response.status) {
      products.value = ProductsModel.fromMap(response.data);
    }

    toggleLoading(false);
  }
}
