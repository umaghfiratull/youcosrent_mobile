import 'package:cosplay_rental/app/data/apiconfig.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/provider/format.dart';
import '../../../modules/home/controllers/home_controller.dart';

Widget Terbaru(BuildContext context) {
  final HomeController controller = Get.find<HomeController>();

  return Obx(() {
    if (controller.isLoading.value) {
      return Center(child: CircularProgressIndicator());
    }

    if (controller.modelterbaru.data == null ||
        controller.modelterbaru.data!.isEmpty) {
      return Center(child: Text("Klik Tab untuk Refresh"));
    }
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: controller.modelterbaru.data!.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
          childAspectRatio: 0.62,
        ),
        itemBuilder: (context, index) {
          final terbaruData = controller.modelterbaru.data![index];
          final harga = terbaruData.detailbarang != null &&
                  terbaruData.detailbarang!.isNotEmpty
              ? terbaruData.detailbarang![0].harga
              : 0;
          final convert = (harga ?? 0).toRupiah();

          final List<String> slider = (terbaruData.detailfoto ?? [])
              .where((foto) => foto != null && foto.foto != null)
              .map((foto) => foto!.foto!)
              .toList();
          final List<String> slider2 = (terbaruData.detailfoto ?? [])
              .where((foto) => foto != null && foto.foto != null)
              .map((foto) =>
                  Api.gambar + foto!.foto!) // Menambahkan Api.gambar di sini
              .toList();
          final ukuran = terbaruData.detailbarang != null &&
                  terbaruData.detailbarang!.isNotEmpty
              ? terbaruData.detailbarang![0].ukuran
              : "0";
          final stok = terbaruData.detailbarang != null &&
                  terbaruData.detailbarang!.isNotEmpty
              ? terbaruData.detailbarang![0].stok
              : "0";
          final idBarang = terbaruData.id;
          final gambar = slider.isNotEmpty
              ? Api.gambar + slider[0]
              : 'https://via.placeholder.com/150';
          print(gambar);
          return InkWell(
            onTap: () {
              Get.toNamed('/detail', arguments: {
                'stok': stok,
                'id': idBarang,
                'gambar': gambar,
                'ukuran': ukuran,
                'slider': slider2,
                'terbaru': terbaruData,
                'harga': harga,
                'rupiah': convert
              });
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(gambar),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width,
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: GestureDetector(
                          onTap: () {
                            controller.toggleFavorite(terbaruData.id!);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.all(4.0),
                            child: Obx(() => Icon(
                                  controller.favoriteIds
                                          .contains(terbaruData.id)
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  size: 20.0,
                                  color: controller.favoriteIds
                                          .contains(terbaruData.id)
                                      ? Colors.red
                                      : Colors.grey,
                                )),
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          terbaruData.namaBarang ?? '',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          convert,
                          style: TextStyle(fontSize: 12),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  });
}
