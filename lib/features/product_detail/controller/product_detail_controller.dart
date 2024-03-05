import 'package:get/get.dart';
import 'package:i_digitech/features/home/services/home_service.dart';
import 'package:i_digitech/features/product_detail/services/product_detail_service.dart';
import 'package:i_digitech/model/products_model.dart';

class ProductDetailController {
  RxBool isLoading = false.obs;
  RxBool isFav = false.obs;
  RxInt selectedSizeIndex = 0.obs;

  void toggleLoading(bool value){
    isLoading.value = value;
  }

  void toggleFavourite(){
    isFav.value = !isFav.value;
  }


  void changeSelectedSizeIndex(int index){
    selectedSizeIndex.value = index;
  }
}