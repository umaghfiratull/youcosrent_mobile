import 'package:cosplay_rental/app/modules/home/views/aksesoris.dart';
import 'package:cosplay_rental/app/modules/home/views/kostum.dart';
import 'package:cosplay_rental/app/modules/home/views/properti.dart';
import 'package:cosplay_rental/app/modules/home/views/sepatu.dart';
import 'package:cosplay_rental/app/modules/home/views/terbaru.dart';
import 'package:cosplay_rental/app/modules/home/views/terlaris.dart';
import 'package:cosplay_rental/utils/collor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:cosplay_rental/app/data/apiconfig.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final List<Widget> tabViews = [
      Terbaru(context),
      Terlaris(context),
      Kostum(context),
      Aksesoris(context),
      Properti(context),
      Sepatu(context),
    ];

    final List<Widget> sliders = [
      AspectRatio(
        aspectRatio: 4 / 4, // Set rasio potret 3:4
        child: Image.network(
          'https://images.tokopedia.net/img/cache/900/VqbcmM/2023/11/22/71c09f78-e851-4a50-a616-8e9ec3567529.jpg',
          fit: BoxFit.cover,
        ),
      ),
      AspectRatio(
        aspectRatio: 3 / 4, // Set rasio potret 3:4
        child: Image.network(
          'https://images.tokopedia.net/img/cache/900/VqbcmM/2024/2/23/a2ffaf27-2705-481f-b690-970f2f1c7282.jpg',
          fit: BoxFit.cover,
        ),
      ),
      AspectRatio(
        aspectRatio: 3 / 4, // Set rasio potret 3:4
        child: Image.network(
          'https://images.tokopedia.net/img/cache/900/VqbcmM/2024/2/20/76791df3-e438-434f-9df1-94964ae19846.jpg',
          fit: BoxFit.cover,
        ),
      ),
      // Tambahkan gambar lainnya di sini
    ];
    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;

    final query = MediaQuery.of(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          titleSpacing: 20,
          title: Text(
            "YouCosRent",
            style: GoogleFonts.aBeeZee(
              textStyle: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                size: 24.0,
              ),
            ),
            IconButton(
              onPressed: () {
                Get.toNamed('/keranjang');
              },
              icon: const Icon(
                Icons.shopping_cart,
                size: 24.0,
              ),
            ),
          ],
        ),
        body: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: NestedScrollView(
                headerSliverBuilder: (context, isScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      expandedHeight: mediaHeight / 2.35,
                      // collapsedHeight: 100,
                      floating: false,
                      pinned: false,
                      flexibleSpace: SingleChildScrollView(
                        physics: NeverScrollableScrollPhysics(),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            color: Colors.black,
                            constraints: BoxConstraints(
                              maxHeight: MediaQuery.of(context).size.width,
                            ),
                            child: FlutterCarousel(
                              options: CarouselOptions(
                                autoPlay: true,
                                autoPlayInterval: const Duration(seconds: 3),
                                disableCenter: true,
                                viewportFraction:
                                    MediaQuery.of(context).size.width > 800.0
                                        ? 0.5
                                        : 1.0,
                                height:
                                    MediaQuery.of(context).size.height * 0.41,
                                indicatorMargin: 10.0,
                                enableInfiniteScroll: true,
                                slideIndicator: const CircularSlideIndicator(),
                              ),
                              items: sliders,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SliverPersistentHeader(
                      floating: true,
                      pinned: true,
                      delegate: MyTabBarDelegate(
                        [
                          "Terbaru",
                          "Terlaris",
                          "Kostum",
                          "Aksesoris",
                          "Properti",
                          "Sepatu"
                        ],
                        (index) {
                          controller.onTabSelected(index);
                        },
                      ),
                    ),
                  ];
                },
                body: Obx(
                  () => Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: IndexedStack(
                        index: controller.selectedIndex.value,
                        children: tabViews,
                      ),
                    ),
                  ),
                ))));
  }
}

class MyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final List<String> tabTitles;
  final Function(int) onTabSelected;
  MyTabBarDelegate(this.tabTitles, this.onTabSelected);
  final HomeController c = Get.find<HomeController>();
  @override
  double get minExtent => 40; // Sesuaikan dengan tinggi tab bar
  @override
  double get maxExtent => 40; // Sesuaikan dengan tinggi tab bar

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
          padding: EdgeInsets.all(5),
          child: Obx(
            () => Container(
              height: 50, // Sesuaikan tinggi tab bar
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: tabTitles
                    .asMap()
                    .entries
                    .map((entry) => _buildTab(entry.value, entry.key))
                    .toList(),
              ),
            ),
          )),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

  Widget _buildTab(String title, int index) {
    return GestureDetector(
      onTap: () {
        onTabSelected(index);
      },
      child: Container(
        width: 100,
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: c.selectedIndex.value == index
              ? AppColor.buttonColor // Warna tab yang aktif
              : Colors
                  .grey, // Warna tab yang tidak aktif // Ubah warna latar belakang tab sesuai kebutuhan
          borderRadius:
              BorderRadius.circular(20), // Ubah border radius sesuai kebutuhan
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color:
                  c.selectedIndex.value == index ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
