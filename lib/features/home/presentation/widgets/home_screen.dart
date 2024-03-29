import 'package:final_exam/features/article/presentation/pages/articles_screen.dart';
import 'package:final_exam/features/calendar/calendar_screen.dart';
import 'package:final_exam/features/chat/presentation/pages/chat_screen.dart';
import 'package:final_exam/features/home/presentation/widgets/catalog_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../assets/icons.dart';
import '../../../profile/presentation/pages/profile_screen.dart';
import '../../data/models/nav_bar_item.dart';
import '../../../home/data/models/navbar_models.dart';
import '../../domain/entity/navigator.dart';

enum NavItemEnum { home, article, chat, calendar, profile }

class HomeScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute<void>(builder: (_) => const HomeScreen());

  const HomeScreen({
    super.key,
  });

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _controller;

  late AnimationController controller;
  final Map<NavItemEnum, GlobalKey<NavigatorState>> _navigatorKeys = {
    NavItemEnum.home: GlobalKey<NavigatorState>(),
    NavItemEnum.article: GlobalKey<NavigatorState>(),
    NavItemEnum.chat: GlobalKey<NavigatorState>(),
    NavItemEnum.calendar: GlobalKey<NavigatorState>(),
    NavItemEnum.profile: GlobalKey<NavigatorState>(),
  };

  List<NavBar> labels = [];

  int _currentIndex = 0;
  int currentPage = 0;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 150));

    _controller = TabController(length: 5, vsync: this);
    controller.addListener(() {});
    _controller.addListener(onTabChange);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onTabChange() {
    setState(() => _currentIndex = _controller.index);
  }

  Widget _buildPageNavigator(NavItemEnum tabItem) => TabNavigator(
        navigatorKey: _navigatorKeys[tabItem]!,
        tabItem: tabItem,
      );

  void changePage(int index) {
    setState(() => _currentIndex = index);
    _controller.animateTo(index);
  }

  @override
  Widget build(BuildContext context) {
    labels = const [
      NavBar(id: 0, icon: AppIcons.home, title: "Asosiy"),
      NavBar(id: 1, icon: AppIcons.article, title: "Maqolalar"),
      NavBar(id: 2, icon: AppIcons.chat, title: "Chat"),
      NavBar(id: 3, icon: AppIcons.calendar, title: "Kalendar"),
      NavBar(id: 4, icon: AppIcons.profile, title: "Profil"),
    ];

    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
      ),
      child: HomeTabControllerProvider(
        controller: _controller,
        child: WillPopScope(
          onWillPop: () async {
            final isFirstRouteInCurrentTab =
                !await _navigatorKeys[NavItemEnum.values[_currentIndex]]!
                    .currentState!
                    .maybePop();
            if (isFirstRouteInCurrentTab) {
              if (NavItemEnum.values[_currentIndex] != NavItemEnum.home) {
                changePage(0);
                return false;
              }
            }
            return isFirstRouteInCurrentTab;
          },
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            bottomNavigationBar: Container(
              height: 94 + MediaQuery.of(context).padding.bottom,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: TabBar(
                enableFeedback: true,
                onTap: (index) {},
                indicator: const BoxDecoration(),
                controller: _controller,
                labelPadding: EdgeInsets.zero,
                tabs: [
                  TabItemWidget(
                    onActiveTap: () {
                      _navigatorKeys[NavItemEnum.values[_currentIndex]]
                          ?.currentState
                          ?.popUntil((route) => route.isFirst);
                    },
                    isActive: _currentIndex == 0,
                    item: labels[0],
                  ),
                  TabItemWidget(
                    onActiveTap: () {
                      _navigatorKeys[NavItemEnum.values[_currentIndex]]
                          ?.currentState
                          ?.popUntil((route) => route.isFirst);
                    },
                    isActive: _currentIndex == 1,
                    item: labels[1],
                  ),
                  TabItemWidget(
                    onActiveTap: () {
                      _navigatorKeys[NavItemEnum.values[_currentIndex]]
                          ?.currentState
                          ?.popUntil((route) => route.isFirst);
                    },
                    isActive: _currentIndex == 2,
                    item: labels[2],
                  ),
                  TabItemWidget(
                    onActiveTap: () {
                      _navigatorKeys[NavItemEnum.values[_currentIndex]]
                          ?.currentState
                          ?.popUntil((route) => route.isFirst);
                    },
                    isActive: _currentIndex == 3,
                    item: labels[3],
                  ),
                  TabItemWidget(
                    onActiveTap: () {
                      _navigatorKeys[NavItemEnum.values[_currentIndex]]
                          ?.currentState
                          ?.popUntil((route) => route.isFirst);
                    },
                    isActive: _currentIndex == 4,
                    item: labels[4],
                  ),
                ],
              ),
            ),
            body: TabBarView(
              controller: _controller,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                CatalogScreen(),
                ArtclesScreen(),
                ChatScreen(),
                CalendarScreen(),
                ProfileScreen()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeTabControllerProvider extends InheritedWidget {
  const HomeTabControllerProvider({
    required super.child,
    required this.controller,
    super.key,
  });

  final TabController controller;

  @override
  bool updateShouldNotify(HomeTabControllerProvider oldWidget) => false;

  static HomeTabControllerProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<HomeTabControllerProvider>()!;
}
