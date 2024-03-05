import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:i_digitech/constants/const.dart';
import 'package:i_digitech/features/home/controller/home_controller.dart';
import 'package:i_digitech/features/home/widgets/product_tile.dart';
import 'package:i_digitech/features/product_detail/controller/product_detail_controller.dart';
import 'package:i_digitech/features/product_detail/widgets/appbar.dart';
import 'package:i_digitech/features/product_detail/widgets/size_box.dart';
import 'package:i_digitech/model/products_model.dart';
import 'package:i_digitech/utils/screen_size.dart';
import 'package:i_digitech/utils/utils.dart';

class ProductDetailScreen extends StatefulWidget {
  ProductDetailScreen({super.key, required this.data});

  ProductData data;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  final ProductDetailController _productDetailController =
      ProductDetailController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: productDetailScreenAppBar(),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(children: [
              Stack(alignment: Alignment.bottomLeft, children: [
                CachedNetworkImage(
                  width: ScreenSize.screenWidth,
                  fit: BoxFit.fitHeight,
                  imageUrl:
                      'https://api.kutir.store/api/v1/upload/productsImage/${widget.data.image![0].path}',
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                    child: CircularProgressIndicator(
                        value: downloadProgress.progress),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                Container(
                    padding: const EdgeInsets.all(6),
                    margin: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade700.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(4)),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star_half_outlined,
                            color: Colors.amber, size: 18),
                        Text(' 4.6 ',
                            style: TextStyle(color: Colors.white, fontSize: 12))
                      ],
                    ))
              ]),

              // Title  and Fav Option Tile
              Container(
                padding: EdgeInsets.all(24),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: ScreenSize.screenWidth * 0.7,
                        padding: EdgeInsets.only(
                            top: 12, left: 12, bottom: 12, right: 32),
                        decoration: BoxDecoration(
                            color: Colors.amber.shade100.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.data.name ?? "Product Name",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Cotton khadi Kurta Set',
                                style: TextStyle(fontSize: 16),
                              )
                            ]),
                      ),
                      Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: Obx(
                            () => GestureDetector(
                              onTap: () {
                                _productDetailController.toggleFavourite();
                              },
                              child: Icon(
                                  !_productDetailController.isFav.value
                                      ? Icons.favorite_outline
                                      : Icons.favorite,
                                  color: Colors.pink,
                                  size: 32),
                            ),
                          ))
                    ]),
              ),

              // Price Tile
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '${rupeesSign} ${widget.data.MRP}',
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough),
                            ),
                            8.pw,
                            Text(
                              '${rupeesSign} ${widget.data.price}',
                              style: TextStyle(fontSize: 24),
                            ),
                            12.pw,
                            Text('${widget.data.discount}% off',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500))
                          ]),
                      Text(
                        "Inclusive of all taxes",
                        style: TextStyle(color: primaryColor, fontSize: 14),
                      )
                    ]),
              ),
              // Size Tile
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Selected Size: XS',
                            style: TextStyle(fontSize: 18)),
                        Text(
                          'Size Chart',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 18),
                        )
                      ],
                    ),
                    18.ph,
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ...widget.data.size.map((size) {
                            return GestureDetector(
                              onTap: () {
                                _productDetailController
                                    .changeSelectedSizeIndex(widget.data.size
                                        .indexWhere(
                                            (element) => element == size));
                              },
                              child: SizeBoxTile(
                                  size: size,
                                  isSelected: _productDetailController
                                          .selectedSizeIndex.value ==
                                      widget.data.size.indexWhere(
                                          (element) => element == size)),
                            );
                          }).toList()
                        ],
                      ),
                    )
                  ],
                ),
              ),

              // Delivery Tile

              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Delivery and services',
                      style: TextStyle(fontSize: 16),
                    ),
                    8.ph,
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: ScreenSize.screenHeight * 0.07,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  hintText: 'Enter Pincode',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: primaryColor, width: 2),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: primaryColor, width: 2),
                                    borderRadius: BorderRadius.circular(12),
                                  )),
                            ),
                          ),
                        ),
                        24.pw,
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 34),
                          height: ScreenSize.screenHeight * 0.07,
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(12)),
                          child: const Center(
                              child: Text(
                            "Verify",
                            style: TextStyle(color: Colors.white),
                          )),
                        )
                      ],
                    )
                  ],
                ),
              ),

              // Product Detail Tile

              // Extra Space of 'Add to cart' Button Height
              (ScreenSize.screenHeight * 0.13).ph,
            ]),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: ScreenSize.screenWidth,
              height: ScreenSize.screenHeight * 0.07,
              child: Row(children: [
                Flexible(
                  flex: 5,
                  child: Container(
                    color: primaryColor,
                    height: ScreenSize.screenHeight * 0.07,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_bag_outlined, color: Colors.white),
                        8.pw,
                        Text(
                          "Add To Bag",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 5,
                  child: Container(
                    height: ScreenSize.screenHeight * 0.07,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Colors.green.withOpacity(0.7), width: 2)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.favorite_outline,
                          color: Colors.green,
                        ),
                        8.pw,
                        Text(
                          "Wishlist",
                          style: TextStyle(
                              color: Colors.green.shade800, fontSize: 18),
                        )
                      ],
                    ),
                  ),
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
}
