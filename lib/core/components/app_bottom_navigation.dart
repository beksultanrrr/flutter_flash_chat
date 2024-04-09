import 'package:flutter/material.dart';
import 'package:flash_chat/core/constants/color_constants.dart';

class AppBottomNavigation extends StatefulWidget {
  final List<Widget> pages;
  final List<String> names;
  final List<String> assetIcons;
  final int initialPageIndex;

  const AppBottomNavigation({
    super.key,
    required this.pages,
    required this.names,
    required this.assetIcons,
    this.initialPageIndex = 0,
  })  : assert(pages.length >= 2),
        assert(pages.length >= initialPageIndex),
        assert(pages.length == assetIcons.length);

  @override
  State<AppBottomNavigation> createState() => _AppBottomNavigationState();
}

class _AppBottomNavigationState extends State<AppBottomNavigation> {
  List<Widget> get pages => widget.pages;
  List<String> get names => widget.names;
  List<String> get assetIcons => widget.assetIcons;
  late int currentPage;

  @override
  void initState() {
    currentPage = widget.initialPageIndex;
    super.initState();
  }

  void changePage(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildPages(),
      bottomNavigationBar: buildBottomNavBar(),
    );
  }

  Widget buildPages() {
    Widget getPage(int index) {
      return Offstage(
        offstage: currentPage != index,
        child: pages[index],
      );
    }

    List<Widget> children = [];
    for (int i = 0; i < pages.length; i++) {
      if (i == 5) {
        children.add(Container());
      } else {
        children.add(getPage(i));
      }
    }
    return Stack(children: children);
  }

  Widget buildBottomNavBar() {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 10,
      currentIndex: currentPage,
      onTap: changePage,
      selectedFontSize: 10,
      unselectedFontSize: 10,
      items: barList(),
    );
  }

  List<BottomNavigationBarItem> barList() {
    List<BottomNavigationBarItem> items = [];
    for (int i = 0; i < assetIcons.length; i++) {
      items.add(BottomNavigationBarItem(
        icon: _buildImage(assetIcons[i], i),
        label: names[i],
      ));
    }
    return items;
  }

  Widget _buildImage(String image, int index) {
    Color color = index == currentPage ? AppColors.primary : const Color(0xff98A1AF);
    return SizedBox(
      width: 28,
      height: 28,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Image.asset(
              image,
              color: color,
              width: 22,
              height: 22,
            ),
          ),
        ],
      ),
    );
  }
}
