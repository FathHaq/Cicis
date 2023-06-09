import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:mobile_api/app/data/cicis_adapter.dart';
import 'package:mobile_api/app/modules/home/views/home_view.dart';
import 'package:mobile_api/app/modules/home/views/loading_screen.dart';

import '../../../repository/box_repository.dart';

class HomeController extends GetxController {
  final TextEditingController inputTitle = TextEditingController();
  final TextEditingController inputNominal = TextEditingController();
  // final formKey = GlobalKey<FormState>();
  String? selectedCategory = "Pemasukan";

  // final cicis = Future.value(<Cicis>[]).obs

  DateTime now = new DateTime.now();

  // final Box _observableBox = BoxRepository.getBox();

  // Box get observableBox => _observableBox;
  // int get cicisCount => _observableBox.length;

  // createCicis({required Cicis cicis}) {
  //   _observableBox.add(cicis);
  //   update();
  // }

  // updateCicis({required int index, required Cicis cicis}) {
  //   _observableBox.putAt(index, cicis);
  //   update();
  // }

  // deleteCicis({required int index}) {
  //   _observableBox.deleteAt(index);
  //   update();
  // }

  // @override
  // void onInit() {
  //   super.onInit();
  //   Hive.openBox("cicis");
  // }

  // @override
  // void dispose() {
  //   inputTitle.dispose();
  //   inputNominal.dispose();
  //   super.dispose();
  // }

  void showForm(BuildContext ctx, int? itemKey) async {
    showModalBottomSheet(
      context: ctx,
      elevation: 5,
      isScrollControlled: true,
      builder: (_) => GestureDetector(
        onTap: () {
          // Menutup modal ketika pengguna mengetuk di luar form
          Navigator.of(_).pop();
        },
        child: Container(
          padding: EdgeInsets.all(25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextFormField(
                controller: inputTitle,
                maxLength: 20,
                decoration: const InputDecoration(
                  labelText: 'Judul Catatan',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                onChanged: (value) {},
              ),
              TextFormField(
                controller: inputNominal,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Nominal',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  suffixIcon: Icon(
                    Icons.attach_money,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                onChanged: (value) {},
              ),
              LayoutBuilder(
                builder: (context, constraint) {
                  List<String> itemStringList = ["Pemasukan", "Pengeluaran"];
                  return FormField(
                    initialValue: false,
                    enabled: true,
                    builder: (FormFieldState<bool> field) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          errorText: field.errorText,
                        ),
                        child: DropdownButtonHideUnderline(
                          child: ButtonTheme(
                            alignedDropdown: false,
                            child: GetBuilder<HomeController>(
                              builder: (homeController) {
                                return DropdownButton<String>(
                                  isExpanded: true,
                                  value: selectedCategory,
                                  icon: Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Icon(
                                      Icons.arrow_drop_down_outlined,
                                      size: 24.0,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .color,
                                    ),
                                  ),
                                  iconSize: 16,
                                  elevation: 16,
                                  style: TextStyle(
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .fontSize,
                                    fontFamily: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .fontFamily,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .color,
                                  ),
                                  underline: Container(
                                    height: 0,
                                    color: Colors.grey[300],
                                  ),
                                  onChanged: (String? newValue) {
                                    update();
                                    selectedCategory = newValue;
                                  },
                                  items: itemStringList
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 0.0,
                                          vertical: 0.0,
                                        ),
                                        child: Text(
                                          value,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              SizedBox(
                height: 50,
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Hive.openBox("cicis");
                      var cicis = Hive.box("cicis");
                      cicis.add(
                        Cicis(
                          title: inputTitle.text,
                          category: selectedCategory.toString(),
                          nominal: int.parse(inputNominal.text),
                          date: now.toString(),
                        ),
                      );
                      update();
                      Navigator.of(ctx).pop();
                      Get.to(LoadingScreen());
                      Get.to(HomeView());
                    },
                    child: const Text("Tambah Catatan"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
