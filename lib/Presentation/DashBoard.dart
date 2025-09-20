import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../utils/color_constants.dart';
import 'package:flutter/rendering.dart';
import '../bloc/internet_status/internet_status_bloc.dart';
import 'Home.dart';

class Dashboard extends StatefulWidget {
  final int? selectedIndex;
  const Dashboard({super.key, this.selectedIndex});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late PageController _pageController;
  int _selectedIndex = 0;
  final ValueNotifier<bool> _showBottomBar = ValueNotifier<bool>(true);

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex ?? 0;
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _showBottomBar.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    _pageController.jumpToPage(index);
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_selectedIndex != 0) {
          setState(() {
            _selectedIndex = 0;
          });
          _pageController.jumpToPage(0);
          return false;
        } else {
          SystemNavigator.pop();
          return true;
        }
      },
      child: Scaffold(
        body: BlocListener<InternetStatusBloc, InternetStatusState>(
          listener: (context, state) {
            if (state is InternetStatusLostState) {
              context.push('/no_internet');
            } else if (state is InternetStatusBackState) {}
          },

          child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (i) {
              HapticFeedback.lightImpact();
              setState(() => _selectedIndex = i);
            },
            children: [Home()],
          ),
          // ),
        ),
        bottomNavigationBar: ValueListenableBuilder<bool>(
          valueListenable: _showBottomBar,
          builder: (context, show, _) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 180),
              switchInCurve: Curves.easeOut,
              switchOutCurve: Curves.easeIn,
              transitionBuilder: (child, animation) {
                final slide = Tween<Offset>(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ).animate(animation);
                return ClipRect(
                  child: SizeTransition(
                    sizeFactor: animation,
                    axisAlignment: -1.0,
                    child: SlideTransition(position: slide, child: child),
                  ),
                );
              },
              child: show
                  ? _buildBottomNav()
                  : const SizedBox.shrink(
                      key: ValueKey('hidden'),
                    ), // zero height
            );
          },
        ),
      ),
    );
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xffFFFFFF).withOpacity(0.9),
      selectedItemColor: primarycolor,
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
        fontSize: 12,
      ),
      unselectedItemColor: Color(0xff6B7280),
      selectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontFamily: 'Roboto',
        fontSize: 15,
        color: Color(0xffFFFFFF),
      ),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      elevation: 0,
      onTap: _onItemTapped,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/icons/Home.png",
            width: 24,
            height: 24,
            color: _selectedIndex == 0 ? primarycolor : Color(0xff6B7280),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/icons/pg.png",
            width: 24,
            height: 24,
            color: _selectedIndex == 1 ? primarycolor : Color(0xff6B7280),
          ),
          label: "PG's",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/icons/rooms.png",
            width: 24,
            height: 24,
            color: _selectedIndex == 2 ? primarycolor : Color(0xff6B7280),
          ),
          label: 'Calls',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/icons/hostlers.png",
            width: 24,
            height: 24,
            color: _selectedIndex == 3 ? primarycolor : Color(0xff6B7280),
          ),
          label: 'Hostelers',
        ),
      ],
    );
  }
}
