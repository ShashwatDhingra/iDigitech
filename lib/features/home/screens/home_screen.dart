import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:i_digitech/constants/const.dart';
import 'package:i_digitech/features/home/controller/home_controller.dart';
import 'package:i_digitech/features/home/widgets/product_tile.dart';
import 'package:i_digitech/model/products_model.dart';
import 'package:i_digitech/utils/routes/routes.dart';
import 'package:i_digitech/utils/screen_size.dart';
import 'package:i_digitech/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scrollController = ScrollController();
  final HomeController _homeController = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProducts();
  }

  Future<void> getProducts()async{
    await _homeController.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          appBar: AppBar(
              title: const Text(
                'Kurti Set',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: primaryColor,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(16),
                      bottomLeft: Radius.circular(16)))),
          body: Obx (() => _homeController.products.value == null || _homeController.isLoading.value
              ? Center(child: Utils.getCircleLoader())
              : Container(
                height: ScreenSize.screenHeight,
                width: ScreenSize.screenWidth,
                child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height /
                              1.03),
                    ),
                    itemCount: _homeController.products.value!.data.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.productDetailScreen,arguments: _homeController.products.value!.data[index]);
                          },
                          child: ProductTile(data: _homeController.products.value!.data[index]));
                    },
                  ),
              )));
  }
}
