import 'package:cosplay_rental/app/data/provider/format.dart';
import 'package:cosplay_rental/app/data/apiconfig.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/controllers/home_controller.dart';

class FavoriteView extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite'),
      ),
      body: Obx(() {
        final favoriteItems = controller.dataModelTerbaru
            .where((item) => controller.favoriteIds.contains(item.id))
            .toList();
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.62,
          ),
          itemCount: favoriteItems.length,
          itemBuilder: (context, index) {
            final favoriteItem = favoriteItems[index];
            final convert = favoriteItem.detailbarang![0].harga ?? 0;
            final List<String> slider = (favoriteItem.detailfoto ?? [])
                .where((foto) => foto != null && foto.foto != null)
                .map((foto) => foto!.foto!)
                .toList();
            final gambar = slider.isNotEmpty
                ? slider[0]
                : 'https://via.placeholder.com/150';
            return InkWell(
              onTap: () {
                // Handle item tap
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      Api.gambar +
                          gambar
                              .toString(), // Assuming you have image URLs in detailfoto
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        favoriteItem.namaBarang ??
                            '', // Assuming namaBarang is a String
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        convert.toRupiah(), // Assuming harga is an int
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
