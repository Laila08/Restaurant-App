import 'package:flutter/material.dart';

/// -------------------- NUM EXTENSIONS --------------------
extension AppNumX on num {
  double get d => toDouble();

  BorderRadius get radiusAll => BorderRadius.circular(d);

  BorderRadius get radiusBottom =>
      BorderRadius.vertical(bottom: Radius.circular(d));

  EdgeInsets get paddingAll => EdgeInsets.all(d);

  EdgeInsets get paddingH => EdgeInsets.symmetric(horizontal: d);
  EdgeInsets get paddingV => EdgeInsets.symmetric(vertical: d);

  EdgeInsets get paddingTop => EdgeInsets.only(top: d);
  EdgeInsets get paddingBottom => EdgeInsets.only(bottom: d);
  EdgeInsets get paddingLeft => EdgeInsets.only(left: d);
  EdgeInsets get paddingRight => EdgeInsets.only(right: d);

  SizedBox get vBox => SizedBox(height: d);
  SizedBox get hBox => SizedBox(width: d);
}

/// -------------------- CONTEXT SIZE EXTENSIONS --------------------
extension ContextSizeX on BuildContext {
  Size get size => MediaQuery.sizeOf(this);

  double get height => size.height;
  double get width => size.width;

  double get statusBar => MediaQuery.paddingOf(this).top;

  double get appBarHeight => statusBar + kToolbarHeight;
}

/// -------------------- NAVIGATION EXTENSIONS --------------------
extension ContextNavX on BuildContext {
  ScaffoldMessengerState get messenger => ScaffoldMessenger.of(this);

  void pop<T>([T? result]) => Navigator.of(this).pop(result);

  void popUntil(RoutePredicate predicate) =>
      Navigator.of(this).popUntil(predicate);

  Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.of(this).pushNamed<T>(routeName, arguments: arguments);
  }

  Future<T?> pushNamedRoot<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.of(
      this,
      rootNavigator: true,
    ).pushNamed<T>(routeName, arguments: arguments);
  }

  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    String routeName, {
    required RoutePredicate predicate,
    Object? arguments,
  }) {
    return Navigator.of(
      this,
    ).pushNamedAndRemoveUntil<T>(routeName, predicate, arguments: arguments);
  }

  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    return Navigator.of(this).pushReplacementNamed<T, TO>(
      routeName,
      result: result,
      arguments: arguments,
    );
  }
}

/// -------------------- WIDGET EXTENSIONS --------------------
extension WidgetX on Widget {
  Widget paddingAll(double value) =>
      Padding(padding: EdgeInsets.all(value), child: this);

  Widget paddingH(double value) => Padding(
    padding: EdgeInsets.symmetric(horizontal: value),
    child: this,
  );

  Widget paddingV(double value) => Padding(
    padding: EdgeInsets.symmetric(vertical: value),
    child: this,
  );

  Widget paddingOnly({
    double top = 0,
    double bottom = 0,
    double left = 0,
    double right = 0,
  }) => Padding(
    padding: EdgeInsets.only(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
    ),
    child: this,
  );

  Widget paddingOnlyDirectional({
    double top = 0,
    double bottom = 0,
    double start = 0,
    double end = 0,
  }) => Padding(
    padding: EdgeInsetsDirectional.only(
      top: top,
      bottom: bottom,
      start: start,
      end: end,
    ),
    child: this,
  );

  Widget centered() => Center(child: this);

  Widget sized({double height = 0, double width = 0}) =>
      SizedBox(height: height, width: width, child: this);

  Widget clip({BorderRadius borderRadius = BorderRadius.zero}) =>
      ClipRRect(borderRadius: borderRadius, child: this);
}
