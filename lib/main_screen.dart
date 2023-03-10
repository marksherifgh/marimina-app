import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marimina_app/bottom_notch_navbar.dart';
import 'package:marimina_app/constants.dart';
import 'package:marimina_app/programs_list_screen.dart';
import 'package:marimina_app/retreats_list_screen.dart';
import 'package:marimina_app/songs_list_screen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with AutomaticKeepAliveClientMixin {
  final _pageController = PageController();
  int maxCount = 3;
  final List<Widget> bottomBarPages = [
    SongsListScreen(),
    RetreatListScreen(),
    ProgramListScreen(),
  ];

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              itemLabelStyle: const TextStyle(
                  fontWeight: FontWeight.w700, color: Colors.white),
              notchColor: ConstantColors.navbarColor,
              pageController: _pageController,
              onTap: (index) {
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 1),
                  curve: Curves.easeIn,
                );
              },
              bottomBarItems: [
                BottomBarItem(
                  inActiveItem: SvgPicture.asset('assets/vectors/lyrics.svg'),
                  activeItem: SvgPicture.asset(
                    'assets/vectors/lyrics.svg',
                    color: ConstantColors.selectedIconColor,
                  ),
                  itemLabel: '????????????????',
                ),
                BottomBarItem(
                  inActiveItem: SvgPicture.asset('assets/vectors/read.svg'),
                  activeItem: SvgPicture.asset(
                    'assets/vectors/read.svg',
                    color: ConstantColors.selectedIconColor,
                  ),
                  itemLabel: '??????????????',
                ),
                BottomBarItem(
                  inActiveItem: SvgPicture.asset('assets/vectors/program.svg'),
                  activeItem: SvgPicture.asset(
                    'assets/vectors/program.svg',
                    color: ConstantColors.selectedIconColor,
                  ),
                  itemLabel: '????????????????',
                ),
              ],
              //bottom navigation bar on scaffold
              color: ConstantColors.navbarColor,
            )
          : null,
    );
  }
}
