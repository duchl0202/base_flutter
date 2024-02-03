import 'package:auto_route/auto_route.dart';
import 'package:emi_calculator/routers/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class AppNavigationScreen extends StatefulWidget {
  const AppNavigationScreen({super.key});

  @override
  State<AppNavigationScreen> createState() => _AppNavigationScreenState();
}

class _AppNavigationScreenState extends State<AppNavigationScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final listRouter = [
      const HomeRoute(),
      const OtherRoute(),
    ];

    return AutoRouter(
      builder: (context, child) {
        var activeIndex = listRouter.indexWhere(
          (d) => context.router.isRouteActive(d.routeName),
        );
        if (activeIndex == -1) {
          activeIndex = 0;
        }
        _tabController.index = activeIndex;

        return Material(
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              shadowColor: Colors.black.withOpacity(0.4),
              leading: const SizedBox.shrink(),
              leadingWidth: 0,
              titleSpacing: 0,
              toolbarHeight: 100.h,
            ),
            body: Column(
              children: [
                Expanded(child: child),
              ],
            ),
          ),
        );
      },
    );
  }
}
