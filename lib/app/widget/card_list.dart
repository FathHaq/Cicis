import 'package:flutter/material.dart';
import 'package:mobile_api/app/config/currency_format.dart';
// import 'package:currecy_format.dart';

class CardListWidget extends StatelessWidget {
  String? title;
  String? category;
  String? date;
  int? nominal;

  CardListWidget(
      {super.key, this.title, this.category, this.date, this.nominal});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              category == 'Pemasukan'
                  ? const Icon(
                      Icons.arrow_circle_up_rounded,
                      color: Colors.greenAccent,
                      size: 40,
                    )
                  : const Icon(
                      Icons.arrow_circle_down_rounded,
                      color: Colors.amberAccent,
                      size: 40,
                    ),
              const SizedBox(
                width: 15.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$title",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Text("$date",
                  style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black54)),
                ],
              ),
            ],
          ),
          Text(
            CurrencyFormat.convertToIdr(nominal, 0),
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
