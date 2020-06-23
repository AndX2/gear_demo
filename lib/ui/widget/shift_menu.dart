import 'dart:math';

import 'package:flutter/material.dart';

const double _closedMenuWidth = 64.0;
const double _opepedMenuWidth = 196.0;
const Duration _menuTransitionDuration = Duration(milliseconds: 300);
const Color _defaultContentCardColor = Colors.white;

class ShiftMenu extends StatefulWidget {
  final List<Widget> closedMenu;
  final List<Widget> openedMenu;
  final List<Widget> content;
  final Color contentCardColor;
  final PageController pageController;
  final defaultController = PageController(
    viewportFraction: 0.5,
    keepPage: true,
  );

  ShiftMenu({
    Key key,
    @required this.content,
    @required this.closedMenu,
    @required this.openedMenu,
    this.contentCardColor = _defaultContentCardColor,
    this.pageController,
  }) : super(key: key);

  @override
  _ShiftMenuState createState() => _ShiftMenuState();
}

class _ShiftMenuState extends State<ShiftMenu> {
  ShiftMenuState _menuState = ShiftMenuState.closed;
  PageController _pageController;
  int currentPage = 0;
  @override
  void initState() {
    _pageController = widget.pageController ??
        PageController(
          viewportFraction: 0.5,
          keepPage: true,
        );
    _pageController.addListener(() {
      if (_pageController.page.round() != currentPage)
        setState(() {
          currentPage = _pageController.page.round();
        });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          if (_menuState.open) {
            _changeMenuState();
            return false;
          }
          return true;
        },
        child: Stack(
          children: [
            _buildOpenedMenu(),
            _buildClosedMenu(),
            AnimatedContainer(
              curve: Curves.easeInOut,
              duration: _menuTransitionDuration,
              width: double.infinity,
              height: double.infinity,
              transform: Matrix4.translationValues(
                _menuState.open ? _opepedMenuWidth : _closedMenuWidth,
                _menuState.open ? 35.0 : 0.0,
                1.0,
              )..scale(_menuState.open ? 0.9 : 1.0),
              decoration: BoxDecoration(
                borderRadius: _menuState.open
                    ? BorderRadius.circular(20)
                    : BorderRadius.circular(0),
              ),
              child: Stack(
                children: [
                  if (!_menuState.open) widget.content[currentPage],
                  if (_menuState.open)
                    _ContentPager(
                      widget.content,
                      _pageController,
                      initPage: currentPage,
                    ),
                  if (_menuState.open)
                    GestureDetector(
                      onTap: () {
                        print('AnimatedContainerStack');
                        _changeMenuState();
                      },
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOpenedMenu() {
    return AnimatedAlign(
      curve: Curves.easeInOut,
      duration: _menuTransitionDuration,
      alignment: Alignment(_menuState.open ? -1.0 : -5.0, 0.0),
      child: GestureDetector(
        child: Container(
          width: _opepedMenuWidth,
          height: double.infinity,
          child: Column(
            children: widget.openedMenu
                .map((item) => ListTile(
                      title: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          item,
                          Spacer(),
                          widget.openedMenu.indexOf(item) == currentPage
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Container(),
                        ],
                      ),
                      onTap: () => _pageController.animateToPage(
                        widget.openedMenu.indexOf(item),
                        duration: Duration(milliseconds: 600),
                        curve: Curves.easeInOut,
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildClosedMenu() {
    return AnimatedAlign(
      curve: Curves.easeInOut,
      duration: _menuTransitionDuration,
      alignment: Alignment(_menuState.open ? -1.5 : -1.0, 0.0),
      child: Container(
        width: _closedMenuWidth,
        height: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: widget.closedMenu
                      .map(
                        (item) => RotatedBox(
                          quarterTurns: 3,
                          child: FlatButton(
                            child: item,
                            splashColor: Colors.grey[600],
                            onPressed: () => setState(() {
                              currentPage = widget.closedMenu.indexOf(item);
                            }),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: _changeMenuState,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _changeMenuState() {
    setState(() {
      _menuState =
          _menuState.open ? ShiftMenuState.closed : ShiftMenuState.opened;
    });
  }
}

enum ShiftMenuState {
  opened,
  closed,
}

extension ShiftMenuStateExt on ShiftMenuState {
  bool get open => this == ShiftMenuState.opened;
}

class _ContentPager extends StatefulWidget {
  final List<Widget> content;
  final PageController pageController;
  final int initPage;
  _ContentPager(
    this.content,
    this.pageController, {
    this.initPage = 0,
    Key key,
  }) : super(key: key);

  @override
  _ContentPagerState createState() => _ContentPagerState();
}

class _ContentPagerState extends State<_ContentPager> {
  double currentPage = 0.0;
  @override
  void initState() {
    currentPage = widget.initPage.toDouble();
    widget.pageController.addListener(_pageChanged);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ...widget.content.map<Widget>(
          (page) {
            print(currentPage);
            final pageIndex = widget.content.indexOf(page);
            final stackDeep = max(currentPage - pageIndex, 0.0);
            return Padding(
              padding: EdgeInsets.only(left: _calcPageOffset(pageIndex)),
              child: Transform.scale(
                scale: 1.0 - 0.03 * stackDeep,
                child: page,
              ),
            );
          },
        ),
        PageView(
          scrollDirection: Axis.horizontal,
          children: List.filled(
            widget.content.length,
            Container(),
          ),
          controller: widget.pageController,
        ),
      ],
    );
  }

  @override
  void dispose() {
    widget.pageController.removeListener(_pageChanged);
    super.dispose();
  }

  double _calcPageOffset(int index) {
    final offset = currentPage - index;
    if (offset >= 0.0) return 0.0 + index * 16.0;
    if (offset < 0.0 && offset >= -1.0) return 200 - 200 * offset;
    return 300.0;
  }

  void _pageChanged() {
    if (widget.pageController.hasClients)
      setState(() {
        currentPage = widget.pageController.page;
      });
  }
}
