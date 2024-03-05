import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:i_digitech/constants/const.dart';
import 'package:i_digitech/model/products_model.dart';
import 'package:i_digitech/utils/screen_size.dart';

class ProductTile extends StatelessWidget {
  ProductTile({super.key, required this.data});

  ProductData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          padding: EdgeInsets.all(12),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                // loadingBuilder: (context, child, loadingProgress) {
                //   if (loadingProgress == null) {
                //     return child;
                //   }
                //   return Center(child: Utils.getCircleLoader());
                // }
                CachedNetworkImage(
                  width: ScreenSize.screenWidth * 0.4,
                  height: ScreenSize.screenHeight * 0.3,
                  fit: BoxFit.fitHeight,
                  imageUrl:
                      'https://api.kutir.store/api/v1/upload/productsImage/${data.image![0].path}',
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress),
                      ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                Container(
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
              ],
            ),
          ),
        ),
        ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(data.name ?? "Product",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.fade),
                ),
                Icon(Icons.favorite_outline, color: Colors.pink)
              ],
            ),
            subtitle: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.description ?? "Description",
                      maxLines: 2,
                      style: const TextStyle(
                          fontSize: 13,
                          overflow: TextOverflow.fade,
                          color: Colors.grey),
                      // maxLines: 1,
                      overflow: TextOverflow.fade),
                  Text(
                    '${rupeesSign} ${data.MRP}',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )
                ],
              ),
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Divider(),
        )
      ],
    );
  }
}
