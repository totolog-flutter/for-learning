import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_youtube1/src/features/home/ui/page_widget.dart';
import 'package:flutter_youtube1/src/features/status/ui/page_widget.dart';
import 'package:flutter_youtube1/src/utils/provider/screen_provider.dart';

// 今回の実装では AppRouterDelegate がリビルドされる可能性があるためグローバルに宣言
final _navigatorKey = GlobalKey<NavigatorState>();

class AppRouterDelegate extends RouterDelegate<Empty>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<Empty> {
  AppRouterDelegate(this.ref);
  final WidgetRef ref;

  String get screenRouteId => ref.watch(screenProvider);
  StateController<String> get provider => ref.read(screenProvider.notifier);
  @override
  final GlobalKey<NavigatorState>? navigatorKey = _navigatorKey;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        const MaterialPage(child: HomePage()),
        if (screenRouteId.isNotEmpty) const MaterialPage(child: StatusPage())
      ],
      onPopPage: (route, result) {
        provider.state = '';
        return route.didPop(result);
      },
    );
  }

  @override
  Future<void> setNewRoutePath(Empty configuration) async {}
}

class Empty {}
