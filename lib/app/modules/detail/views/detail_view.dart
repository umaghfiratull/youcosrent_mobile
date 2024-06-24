import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../../../utils/collor.dart';
import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  DetailView({Key? key}) : super(key: key);
  final Map<String, dynamic> arguments = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final terbaruData = arguments['terbaru'];
    final rupiah = arguments['rupiah'];
    final detailFoto = arguments['slider'];
    final ukuran = arguments['ukuran'];
    final stok = arguments['stok'];

    Color itemColor = Color(0xfffcd1d1);
    print('INI ADALAH HASIL DARI PARSING ARGUMENt:$detailFoto');

    final List<Widget> sliderss = (detailFoto as List<String>).map((fotoUrl) {
      return AspectRatio(
        aspectRatio: 3 / 4, // Set rasio potret 3:4
        child: Image.network(
          fotoUrl,
          fit: BoxFit.cover,
        ),
      );
    }).toList();
    print('INI UKURAN $ukuran');
    final List<Map<String, String>> sizeGuide = [
      {'type': 'Inner', 'bust': '94 cm', 'length': '86 cm', 'hip': '116 cm'},
      {'type': 'Outer', 'bust': '96 cm', 'length': '109 cm', 'hip': '116 cm'},
    ];
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text("Tarif Sewa"),
                  ),
                  Row(
                    children: [
                      Text(
                        '${rupiah}/',
                        style: TextStyle(
                            color: Color(0xff231d1f),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        '4 hari',
                        style: TextStyle(
                            color: Color(0xff231d1f),
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: FloatingActionButton(
                backgroundColor: AppColor.buttonColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    side: BorderSide(color: Colors.grey)),
                onPressed: () async {
                  if (stok == 0) {
                    Get.snackbar('Eror', 'Barang Sedang disewa');
                  } else {
                    _showDatePicker(context);
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Tambahkan ke keranjang',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      body: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          backgroundColor: itemColor,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () async {
                Get.back();
              },
            ),
          ),
          expandedHeight: 280.0,
          floating: true,
          pinned: false,
          snap: false,
          elevation: 50,
          flexibleSpace: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
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
                        MediaQuery.of(context).size.width > 800.0 ? 0.5 : 1.0,
                    height: MediaQuery.of(context).size.height * 0.39,
                    indicatorMargin: 10.0,
                    enableInfiniteScroll: true,
                    slideIndicator: const CircularSlideIndicator(),
                  ),
                  items: sliderss,
                ),
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${terbaruData.namaBarang}',
                          style: TextStyle(
                              color: Color(0xff231d1f),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "${terbaruData.deskripsi}",
                      style: TextStyle(
                        color: Color(0xff989898),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Item Size',
                      style: TextStyle(
                          color: Color(0xff231d1f),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _buildSizeWidget('S', ukuran == 'S'),
                          const SizedBox(
                            width: 5.0,
                          ),
                          _buildSizeWidget('M', ukuran == 'M'),
                          const SizedBox(
                            width: 5.0,
                          ),
                          _buildSizeWidget('L', ukuran == 'L'),
                          const SizedBox(
                            width: 5.0,
                          ),
                          _buildSizeWidget('XL', ukuran == 'XL'),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Size Guide',
                            style: TextStyle(
                                color: Color(0xff231d1f),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          Table(
                            columnWidths: {
                              0: FlexColumnWidth(1),
                              1: FlexColumnWidth(2),
                              2: FlexColumnWidth(2),
                              3: FlexColumnWidth(2),
                            },
                            border: TableBorder.all(color: Colors.grey),
                            children: [
                              TableRow(children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text('Size'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text('Bust'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text('Length'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text('Hip'),
                                ),
                              ]),
                              ...sizeGuide
                                  .map((item) => TableRow(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text(item['type']!),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text(item['bust']!),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text(item['length']!),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text(item['hip']!),
                                          ),
                                        ],
                                      ))
                                  .toList(),
                            ],
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Row(
                            children: [
                              Text(
                                'Stok : ',
                                style: TextStyle(
                                    color: Color(0xff231d1f),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                stok == 0 ? 'Sedang disewa' : '${stok}',
                                style: TextStyle(
                                    color: Color(0xff231d1f),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ]),
            )
          ]),
        )
      ]),
    );
  }

  Widget _buildSizeWidget(String size, bool isSelected) {
    Color color = isSelected ? Colors.red : Colors.white;
    Color textColor = isSelected ? Colors.white : Colors.grey;

    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 25,
        width: 25,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Center(
          child: Text(
            size,
            style: TextStyle(
              color: textColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  void _showDatePicker(BuildContext context) {
    final DetailController controller = Get.put(DetailController());
    late String? formattedStartDate;
    late String? formattedEndDate;
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Pilih Alamat",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () => Get.back(),
                    )
                  ],
                ),
                SizedBox(height: 5),
                GestureDetector(
                  onTap: () {},
                  child: TextField(
                    enabled: false,
                    controller: controller.addressController
                      ..text = controller.address.value ?? '',
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Masukkan alamat Anda',
                      isDense: true,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Pilih Durasi Sewa",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Expanded(
                  child: SfDateRangePicker(
                    selectionMode: DateRangePickerSelectionMode.range,
                    minDate: DateTime.now(),
                    onSelectionChanged:
                        (DateRangePickerSelectionChangedArgs args) {
                      if (args.value is PickerDateRange) {
                        final PickerDateRange range = args.value;
                        final DateFormat formatter = DateFormat('yyyy-MM-dd');
                        controller.selectedStartDate.value = range.startDate;
                        controller.selectedEndDate.value = range.endDate;
                        formattedStartDate =
                            formatter.format(range.startDate ?? DateTime.now());
                        formattedEndDate =
                            formatter.format(range.endDate ?? DateTime.now());
                        controller.isDateRangeSelected = true;
                        print(
                            'Range selected: From $formattedStartDate to $formattedEndDate');
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.buttonColor,
                    textStyle: TextStyle(fontSize: 16),
                    padding: EdgeInsets.symmetric(vertical: 12),
                    elevation: 5,
                  ),
                  onPressed: () async {
                    final terbaruData = arguments['terbaru'];
                    final harga = arguments['harga'];
                    final ukuran = arguments['ukuran'];
                    final gambar = arguments['gambar'];
                    final stok = arguments['stok'];
                    final id = arguments['id'];

                    print('ARGUMEN: $id');
                    print('ARGUMEN: $harga');
                    if (!controller.isDateRangeSelected) {
                      Get.snackbar(
                          'Error', 'Pilih rentang tanggal terlebih dahulu',
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                          duration: Duration(seconds: 2),
                          snackPosition: SnackPosition.TOP);
                      return;
                    } else {
                      controller.addToCart(terbaruData.namaBarang, ukuran,
                          harga, gambar, stok, id);
                      Get.back();
                    }
                  },
                  child: Center(
                    child: Text(
                      "Tambahkan",
                      style: GoogleFonts.aBeeZee(
                        textStyle: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
