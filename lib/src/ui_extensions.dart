import 'package:flutter/material.dart';

import 'context.dart';

/// UI Extensions on context
/// Usage: ' context.dc.. '
extension UIExtension on UiExtension {
/*  /// Show toast with message.
  ///
  /// Usage:
  ///   context.dc.showToast('Message');
  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }*/

  /// Show alert dialog with message.
  ///
  /// Usage:
  ///   context.dc.showAlertDialog(context,'Title','Message');
  void showAlertDialog(BuildContext context, String title, String message) {
    final Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    final AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

///Widget extension for wrapping caller widget with row.
extension WrapWithRowExtension on Widget {
  /// Wraps this widget with row and returns that [Row] widget
  ///
  /// Usage:
  /// ```
  ///   myWidget.wrapWithRow();
  /// ```
  ///
  /// Defaults:
  /// * mainAxisAlignment = MainAxisAlignment.start
  /// * mainAxisSize = MainAxisSize.max
  /// * crossAxisAlignment = CrossAxisAlignment.center
  /// * verticalDirection = VerticalDirection.down
  Row wrapWithRow({
    Key? key,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline? textBaseline,
  }) =>
      Row(
        key: key,
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        crossAxisAlignment: crossAxisAlignment,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        textBaseline: textBaseline,
        children: [this],
      );
}

///Widget extension for wrapping caller widget with column.
extension WrapWithColumnExtension on List<Widget> {
  /// Wraps this widget with column and returns that [Column] widget
  ///
  /// Usage:
  /// ```
  ///   myWidget.wrapWithColumn();
  /// ```
  ///
  /// Defaults:
  /// * mainAxisAlignment = MainAxisAlignment.start
  /// * mainAxisSize = MainAxisSize.max
  /// * crossAxisAlignment = CrossAxisAlignment.center
  /// * verticalDirection = VerticalDirection.down
  Column wrapWithColumn({
    Key? key,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline? textBaseline,
  }) =>
      Column(
        key: key,
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        crossAxisAlignment: crossAxisAlignment,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        textBaseline: textBaseline,
        children: this,
      );
}

///Widget extension for wrapping caller widget with [Expanded].
extension WrapWithExpandedExtension on Widget {
  /// Wraps this widget with [Expanded] and returns that [Expanded] widget
  ///
  /// Usage:
  /// ```
  ///   myWidget.wrapWithExpanded();
  /// ```
  ///
  /// Defaults:
  /// * flex = 1
  Expanded wrapWithExpanded({
    Key? key,
    int flex = 1,
  }) =>
      Expanded(key: key, flex: flex, child: this);
}

///Widget extension for wrapping caller widget with [Padding].
extension WrapWithPaddingExtension on Widget {
  /// Optionally wraps widget with padding.
  ///
  /// * `condition` defaults to `true` (wrapped with padding).
  ///
  ///if `condition` is `false` => caller widget is returned unaltered.
  Widget wrapWithPadding(EdgeInsetsGeometry padding, {bool condition = true}) =>
      condition ? Padding(padding: padding, child: this) : this;
}

///Widget extension for wrapping caller widget with [Padding].
extension WrapWithMarginExtension on Widget {
  /// Optionally wraps widget with padding.
  ///
  /// * `condition` defaults to `true` (wrapped with padding).
  ///
  ///if `condition` is `false` => caller widget is returned unaltered.
  Widget wrapWithMargin(EdgeInsetsGeometry margin, {bool condition = true}) =>
      condition ? Container(margin: margin, child: this) : this;
}

/// Widget extension for wrapping caller widget with [Container].
extension WrapWithContainerExtension on Widget {
  /// Wraps `this` widget to a [Container]
  ///
  /// All params are the same as for [Container] class.
  Container wrapWithContainer({
    Key? key,
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    Color? color,
    Decoration? decoration,
    Decoration? foregroundDecoration,
    double? width,
    double? height,
    BoxConstraints? constraints,
    EdgeInsetsGeometry? margin,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
  }) =>
      Container(
        key: key,
        alignment: alignment,
        padding: padding,
        color: color,
        decoration: decoration,
        foregroundDecoration: foregroundDecoration,
        width: width,
        height: height,
        constraints: constraints,
        margin: margin,
        transform: transform,
        transformAlignment: transformAlignment,
        child: this,
      );
}

/// Widget extension for converting list of widget with [Wrap].
extension ListToWrapWidgetExtensions on List<Widget> {
  /// Wraps `this` list of widgets to Wrap widget.
  ///
  /// Tip:
  ///
  /// Use instead of [Row] widgets when widgets in `this` list don't fit screen widht.
  ///
  /// Wrap widget automatically breaks row in multiple rows so each widget from `this` list
  /// is visible on the screen.
  ///
  /// Usage:
  /// ```
  ///   [widget1, widget2, ..., widgetN].toWrapWidget();
  /// ```
  Wrap toWrapWidget({
    Key? key,
    Axis direction = Axis.horizontal,
    WrapAlignment alignment = WrapAlignment.start,
    double spacing = 0.0,
    WrapAlignment runAlignment = WrapAlignment.start,
    double runSpacing = 0.0,
    WrapCrossAlignment crossAxisAlignment = WrapCrossAlignment.start,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    Clip clipBehavior = Clip.none,
  }) =>
      Wrap(
        key: key,
        direction: direction,
        alignment: alignment,
        spacing: spacing,
        runSpacing: runSpacing,
        crossAxisAlignment: crossAxisAlignment,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        clipBehavior: clipBehavior,
        children:
            //because [Row] wants the full screen width by default:
            map((e) => (e is Row) ? IntrinsicWidth(child: e) : e).toList(),
      );
}
