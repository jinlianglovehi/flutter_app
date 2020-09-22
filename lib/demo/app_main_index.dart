import 'package:flutter/material.dart';

/**
 *  主页面的操作
 */
class AppMainIndex extends StatefulWidget {
  @override
  _AppMainIndexState createState() => _AppMainIndexState();
}

class _AppMainIndexState extends State<AppMainIndex> {
  var _currnetIndex = 0;

  var _onPageViewController = new PageController(initialPage: 0);

  void _onSearchPressBtn() {
    print("点击search btn ");
  }

  void _onPrintPressBtn() {
    print("点击Press Btn ");
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("主页"),
          actions: [
            IconButton(icon: Icon(Icons.search), onPressed: _onSearchPressBtn),
            IconButton(icon: Icon(Icons.print), onPressed: _onPrintPressBtn)
          ],
        ),
        body: new PageView.builder(
          onPageChanged: _onPageViewPageChange,
          controller: _onPageViewController,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Text("第一页 ");
            } else if (index == 1) {
              return Text("第二页页");
            } else if (index == 2) {
              return Text("第三呀");
            }
            return null;
          },
          itemCount: 3,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              title: Text("我的书记"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.my_location),
              title: Text("我的位置"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.my_location),
              title: Text("我的位置"),
            ),
          ],
          /**
           * 选择的pressClick操作
           */

          currentIndex: _currnetIndex,
          onTap: _onTabPress,
        ),
      ),
    );
  }

  /**
   * 点击操作 tab按键的操作
   */
  void _onTabPress(int index) {
    print("_onTabPress index : $index");

    setState(() {
      //动画切换
      _onPageViewController.animateToPage(index,
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    });
  }

  /**
   *  pageViewChange的变化
   */

  // 左侧的手势的huadong 操作
  void _onPageViewPageChange(int index) {
    print("_onPageViewPageChange:$index ");

    setState(() {
      if (_currnetIndex != index) {
        _currnetIndex = index;
      }
    });
  }
}
