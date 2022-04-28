import 'package:dashboard/screen/dashboard_screen.dart';
import 'package:flutter/material.dart';

const dashboardRoute = "/home";

PageRouteBuilder? createRoutes(settings) {
  switch (settings.name) {
    case dashboardRoute:
      return createRoute(const DashboardScreen());
  }
  return null;
}

PageRouteBuilder createRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (_, __, ___) => page,
  );
}
