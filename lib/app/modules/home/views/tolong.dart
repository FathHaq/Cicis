// import 'dart:convert';

// import 'package:flutter/material.dart';

// import 'package:get/get.dart';
// import 'package:hive/hive.dart';
// import 'package:mobile_api/app/data/cicis_adapter.dart';

// import '../../../../main.dart';
// import '../../../config/currency_format.dart';
// import '../../../widget/card_list.dart';
// import '../../../widget/modal_form.dart';
// import '../controllers/home_controller.dart';

// class HomeView extends GetView<HomeController> {
//   const HomeView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     HomeController controller = Get.put(HomeController());
//     var widthScreen = MediaQuery.of(context).size;
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () {
//           controller.update();
//           controller.showForm(context, null);
//         },
//       ),
//       body: Container(
//         child: Column(
//           children: [
//             Container(
//               // height: 400,
//               padding: const EdgeInsets.all(25),
//               color: Colors.blue,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(
//                     height: 28.0,
//                   ),
//                   const Text(
//                     'Dashboard',
//                     style: TextStyle(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 20,
//                         color: Colors.white),
//                   ),
//                   const SizedBox(
//                     height: 68.0,
//                   ),
//                   const Text(
//                     "Hi, Miftahul!",
//                     style: TextStyle(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 16,
//                         color: Colors.white54),
//                   ),
//                   const SizedBox(
//                     height: 10.0,
//                   ),
//                   const Text(
//                     "Total Keuangan",
//                     style: TextStyle(
//                       fontWeight: FontWeight.w600,
//                       fontSize: 20,
//                       color: Colors.white,
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       // GetBuilder<HomeController>(
//                       //   initState: (state) {
//                       //     Hive.openBox("cicis");
//                       //   },
//                       //   builder: (homeController) {
//                       //     if (homeController.isBlank == ConnectionState.done) {
//                       //       var cicis = Hive.box("cicis");
//                       //       int totalAcis = 0;
//                       //       for (var i = 0; i < cicis.length; i++) {
//                       //         Cicis acis = cicis.getAt(i);
//                       //         totalAcis += acis.nominal;
//                       //       }
//                       //       return Text(
//                       //         CurrencyFormat.convertToIdr(totalAcis, 0),
//                       //         style: const TextStyle(
//                       //           fontWeight: FontWeight.w600,
//                       //           fontSize: 42,
//                       //           color: Colors.white,
//                       //         ),
//                       //       );
//                       //     } else {
//                       //       return const Center(
//                       //         child: CircularProgressIndicator(),
//                       //       );
//                       //     }
//                       //   },
//                       // ),
//                       FutureBuilder(
//                         future: Hive.openBox("cicis"),
//                         builder: (context, snapshot) {
//                           if (snapshot.connectionState ==
//                               ConnectionState.done) {
//                             var cicis = Hive.box("cicis");
//                             int totalAcis = 0;
//                             for (var i = 0; i < cicis.length; i++) {
//                               Cicis acis = cicis.getAt(i);
//                               totalAcis += acis.nominal;
//                             }
//                             return Text(
//                               CurrencyFormat.convertToIdr(totalAcis, 0),
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 42,
//                                 color: Colors.white,
//                               ),
//                             );
//                           } else {
//                             return const Center(
//                               child: CircularProgressIndicator(),
//                             );
//                           }
//                         },
//                       ),
//                       SizedBox(
//                         height: 50,
//                         width: 50,
//                         child: IconButton(
//                           onPressed: () {},
//                           icon: const Icon(Icons.notifications_active,
//                               color: Colors.white, size: 35),
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//             Expanded(
//               child: FutureBuilder(
//                 future: Hive.openBox("cicis"),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.done) {
//                     if (snapshot.hasError) {
//                       Hive.box('cicis').clear();
//                       return Center(
//                         child: Text("Error nih : ${snapshot.error}"),
//                       );
//                     } else {
//                       var cicis = Hive.box('cicis');
//                       if (cicis.length == 0) {
//                         return const Center(
//                           child: Text("belum ada Data"),
//                         );
//                       }
//                       return ListView.builder(
//                         physics: const BouncingScrollPhysics(),
//                         itemCount: cicis.length,
//                         itemBuilder: (_, i) {
//                           Cicis acis = cicis.getAt(i);
//                           return CardListWidget(
//                             title: acis.title,
//                             category: acis.category,
//                             date: acis.date,
//                             nominal: acis.nominal,
//                           );
//                         },
//                       );
//                     }
//                   } else {
//                     return const Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   }
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
