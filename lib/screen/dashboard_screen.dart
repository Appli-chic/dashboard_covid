import 'package:dashboard/component/side_bar.dart';
import 'package:flutter/material.dart';

import '../utils/platform.dart';
import 'continents_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final PageController _pageController = PageController();
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    if (isMobile()) {
      return _buildMobile();
    } else {
      return _buildDesktop();
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildMobile() {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: _onPageChanged,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.vpn_lock),
            label: 'Continents',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flag),
            label: 'Countries',
          ),
        ],
      ),
    );
  }

  Widget _buildDesktop() {
    return Scaffold(
      body: Row(
        children: [
          SideBar(onPageChanged: _onPageChanged),
          Expanded(
            child: _buildBody(),
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return PageView(
      controller: _pageController,
      children: const [
        ContinentScreen(),
        SizedBox(),
      ],
    );
  }

  _onPageChanged(int index) {
    if (_index != index) {
      setState(() {
        _index = index;
      });

      _pageController.jumpToPage(_index);
    }
  }
}
