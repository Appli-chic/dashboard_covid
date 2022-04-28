import 'package:dashboard/api/covid_api.dart';
import 'package:dashboard/component/chart_card.dart';
import 'package:dashboard/component/data_card.dart';
import 'package:dashboard/model/covid_continent.dart';
import 'package:dashboard/utils/platform.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ContinentScreen extends StatefulWidget {
  const ContinentScreen({Key? key}) : super(key: key);

  @override
  State<ContinentScreen> createState() => _ContinentScreenState();
}

class _ContinentScreenState extends State<ContinentScreen> {
  List<CovidContinent> _covidContinents = [];
  CovidContinent? _selectedContinent;

  @override
  void initState() {
    super.initState();
    _loadContinentsData();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    if (isMobile() || width < 1200) {
      return _buildMobile();
    } else {
      return _buildDesktop();
    }
  }

  Widget _buildMobile() {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Continents"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            children: _mobileBody(),
          ),
        ),
      ),
    );
  }

  List<Widget> _mobileBody() {
    return [
      ChartCard(
        title: "Number of cases",
        type: ChartCardType.pieChart,
        dataList: _covidContinents
            .map((c) => ChartData(c.continent ?? "", c.cases ?? 0))
            .toList(),
      ),
      const SizedBox(height: 16),
      ChartCard(
        title: "Number of death",
        unit: Unit.thousand,
        type: ChartCardType.pieChart,
        dataList: _covidContinents
            .map((c) => ChartData(c.continent ?? "", c.deaths ?? 0))
            .toList(),
      ),
      const SizedBox(height: 16),
      _buildContinentDropDown(),
      const SizedBox(height: 16),
      _buildMobileContinentInformation(),
    ];
  }

  Widget _buildContinentDropDown() {
    return DropdownButton<CovidContinent>(
      items: _covidContinents.map((CovidContinent value) {
        return DropdownMenuItem(
          value: value,
          child: Text(value.continent ?? ""),
        );
      }).toList(),
      value: _selectedContinent,
      onChanged: _onContinentSelectedChanged,
    );
  }

  Widget _buildMobileContinentInformation() {
    if (_selectedContinent == null) {
      return const SizedBox.shrink();
    } else {
      return Column(
        children: [
          DataCard(
            title: "Deaths",
            iconPath: 'assets/death.png',
            data: _selectedContinent?.deaths,
          ),
          const SizedBox(height: 16),
          DataCard(
            title: "Cases",
            iconPath: 'assets/cases.png',
            data: _selectedContinent?.cases,
            color: Colors.green,
          ),
          const SizedBox(height: 16),
          DataCard(
            title: "Recovered",
            iconPath: 'assets/recovered.png',
            data: _selectedContinent?.recovered,
            color: Colors.pink,
          )
        ],
      );
    }
  }

  Widget _buildDesktop() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _desktopCharts(),
              const SizedBox(height: 16),
              _buildContinentDropDown(),
              const SizedBox(height: 16),
              _buildDesktopContinentInformation(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _desktopCharts() {
    return Row(
      children: [
        Expanded(
          child: ChartCard(
            title: "Number of cases",
            type: ChartCardType.columnChart,
            dataList: _covidContinents
                .map((c) => ChartData(c.continent ?? "", c.cases ?? 0))
                .toList(),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ChartCard(
            title: "Number of death",
            unit: Unit.thousand,
            type: ChartCardType.pieChart,
            dataList: _covidContinents
                .map((c) => ChartData(c.continent ?? "", c.deaths ?? 0))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopContinentInformation() {
    if (_selectedContinent == null) {
      return const SizedBox.shrink();
    } else {
      return Row(
        children: [
          Expanded(
            child: DataCard(
              title: "Deaths",
              iconPath: 'assets/death.png',
              data: _selectedContinent?.deaths,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: DataCard(
              title: "Cases",
              iconPath: 'assets/cases.png',
              data: _selectedContinent?.cases,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: DataCard(
              title: "Recovered",
              iconPath: 'assets/recovered.png',
              data: _selectedContinent?.recovered,
              color: Colors.pink,
            ),
          )
        ],
      );
    }
  }

  _onContinentSelectedChanged(CovidContinent? newValue) {
    setState(() {
      _selectedContinent = newValue;
    });
  }

  _loadContinentsData() async {
    final dio = Dio();
    final covidApi = CovidApi(dio);

    var covidContinents = await covidApi.getCovidForAllContinents();

    setState(() {
      _covidContinents = covidContinents;
      _selectedContinent = covidContinents[0];
    });
  }
}
