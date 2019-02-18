library scroll_appbar;

import 'package:flutter/material.dart';

class ScrollAppBar extends StatefulWidget implements PreferredSizeWidget {
  final ScrollController controller;
  final MaterialColor backgroundColor;

  final Widget leading;
  final bool automaticallyImplyLeading;
  final Widget title;
  final List<Widget> actions;
  final Widget flexibleSpace;
  final PreferredSizeWidget bottom;
  final double elevation;
  final Brightness brightness;
  final IconThemeData iconTheme;
  final TextTheme textTheme;
  final bool primary;
  final bool centerTitle;
  final double titleSpacing;
  final double toolbarOpacity;
  final double bottomOpacity;

  ScrollAppBar({
    Key key,
    @required this.controller,
    @required this.backgroundColor,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.title,
    this.actions,
    this.flexibleSpace,
    this.bottom,
    this.elevation = 4.0,
    this.brightness,
    this.iconTheme,
    this.textTheme,
    this.primary = true,
    this.centerTitle,
    this.titleSpacing = NavigationToolbar.kMiddleSpacing,
    this.toolbarOpacity = 1.0,
    this.bottomOpacity = 1.0,
  })  : assert(controller != null),
        assert(backgroundColor != null),
        super(key: key);

  @override
  _ScrollAppBarState createState() => _ScrollAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(56);
}

class _ScrollAppBarState extends State<ScrollAppBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _buildBackground(),
        AppBar(
          actions: widget.actions,
          automaticallyImplyLeading: widget.automaticallyImplyLeading,
          backgroundColor: Colors.transparent,
          title: widget.title,
          bottom: widget.bottom,
          bottomOpacity: widget.bottomOpacity,
          brightness: widget.brightness,
          centerTitle: widget.centerTitle,
          elevation: widget.elevation,
          flexibleSpace: widget.flexibleSpace,
          iconTheme: widget.iconTheme,
          leading: widget.leading,
          primary: widget.primary,
          textTheme: widget.textTheme,
          titleSpacing: widget.titleSpacing,
          toolbarOpacity: widget.toolbarOpacity,
        ),
      ],
    );
  }

  Widget _buildBackground() {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, child) {
        double current = widget.controller.offset ?? 0;
        double max = widget.controller.position.maxScrollExtent ?? 1;

        return Row(
          children: <Widget>[
            Expanded(
              flex: current.toInt(),
              child: Container(color: widget.backgroundColor.shade600),
            ),
            Expanded(
              flex: (max - current).toInt(),
              child: Container(color: widget.backgroundColor),
            ),
          ],
        );
      },
    );
  }
}

