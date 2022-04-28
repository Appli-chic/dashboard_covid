import 'dart:math';

import 'package:dashboard/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartCard extends StatelessWidget {
  final String title;
  final List<ChartData> dataList;
  final ChartCardType type;
  final Unit unit;

  const ChartCard({
    Key? key,
    required this.title,
    required this.dataList,
    this.type = ChartCardType.columnChart,
    this.unit = Unit.million,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: _buildChart(),
    );
  }

  Widget _buildChart() {
    switch (type) {
      case ChartCardType.columnChart:
        return _buildColumnChart();
      case ChartCardType.pieChart:
        return _buildPieChart();
      default:
        return _buildColumnChart();
    }
  }

  Widget _buildColumnChart() {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      title: ChartTitle(text: "$title (${unit.name})"),
      series: <ChartSeries<ChartData, String>>[
        ColumnSeries<ChartData, String>(
          dataSource: dataList,
          pointColorMapper: (ChartData data, _) => getColorFromName(data.name),
          xValueMapper: (ChartData data, _) => data.name,
          yValueMapper: (ChartData data, _) => (data.data / unit.number).floor(),
          color: const Color(0xFF0464F7),
        )
      ],
    );
  }

  Widget _buildPieChart() {
    return SfCircularChart(
      legend: Legend(isVisible: true),
      title: ChartTitle(text: "$title (${unit.name})"),
      series: <CircularSeries>[
        PieSeries<ChartData, String>(
          dataSource: dataList,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
          pointColorMapper: (ChartData data, _) => getColorFromName(data.name),
          xValueMapper: (ChartData data, _) => data.name,
          yValueMapper: (ChartData data, _) => (data.data / unit.number).floor(),
        )
      ],
    );
  }
}

class ChartData {
  final String name;
  final int data;

  ChartData(this.name, this.data);
}

class Unit {
  const Unit._(this.number, this.name);

  final int number;
  final String name;

  static const Unit thousand = Unit._(1000, "In thousands");

  static const Unit million = Unit._(1000000, "In millions");
}

class ChartCardType {
  const ChartCardType._(this.index);

  final int index;

  static const ChartCardType columnChart = ChartCardType._(0);

  static const ChartCardType pieChart = ChartCardType._(1);
}
