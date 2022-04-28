import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DataCard extends StatelessWidget {
  final String title;
  final String iconPath;
  final int? data;
  final Color color;

  const DataCard({
    Key? key,
    required this.title,
    required this.iconPath,
    this.data,
    this.color = Colors.red,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(iconPath),
                  color: Theme.of(context).textTheme.bodyText1?.color,
                  width: 20,
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 4),
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              NumberFormat.decimalPattern().format(data),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            height: 2,
            color: color,
          ),
        ],
      ),
    );
  }
}
