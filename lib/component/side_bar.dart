import 'package:flutter/material.dart';

class SideBar extends StatefulWidget {
  final Function(int index) onPageChanged;

  const SideBar({
    Key? key,
    required this.onPageChanged,
  }) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: double.infinity,
      color: Theme.of(context).dialogBackgroundColor,
      child: Column(
        children: [
          _buildSideBarItem("Continents", Icons.vpn_lock, 0),
          const SizedBox(height: 4),
          _buildSideBarItem("Countries", Icons.flag, 1),
        ],
      ),
    );
  }

  Widget _buildSideBarItem(String title, IconData icon, int index) {
    var isSelected = _index == index;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        widget.onPageChanged(index);
        setState(() {
          _index = index;
        });
      },
      child: Container(
        height: 40,
        color: isSelected ? Colors.blue.withOpacity(0.6) : null,
        child: Row(
          children: [
            Container(
              color: isSelected ? Colors.blue : null,
              width: 5,
            ),
            Container(
              margin: const EdgeInsets.only(left: 16),
              child: Icon(icon, color: isSelected ? Colors.white : null),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 4, right: 16),
                child: Text(
                  title,
                  style: TextStyle(color: isSelected ? Colors.white : null),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
