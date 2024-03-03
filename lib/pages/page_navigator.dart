import 'package:flutter/material.dart' hide Page;
import 'package:hospital_tracker/data/page_enum.dart';
import 'package:hospital_tracker/pages/patients_page.dart';
import 'package:hospital_tracker/pages/search_page.dart';
import 'package:hospital_tracker/pages/statistics_page.dart';

class PageNavigator extends StatefulWidget {
  const PageNavigator({super.key});

  @override
  State<PageNavigator> createState() => _PageNavigatorState();
}

class _PageNavigatorState extends State<PageNavigator> {

  late Page _currentPage = Page.home;

  void setCurrentPage(Page page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Builder(builder: (context) => makePageWidget(_currentPage)),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        notchMargin: 6.0,
        color: Theme.of(context).colorScheme.surface,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: getBottomBarIcons(),
        ),
      ),
    );
  }

  Widget makePageWidget(Page page) => switch (page) {
    Page.home => const PatientsPage(),
    Page.search => SearchPage(),
    Page.profile => StatisticsPage()
  };

  List<Widget> getBottomBarIcons() {
    double iconSize = 25;
    List<Widget> body = [];
    for (Page page in Page.values) {
      body.add(const Expanded(child: SizedBox()));
      var iconColor = _currentPage == page ? Colors.blue : Theme.of(context).colorScheme.outline;
      body.add(IconButton(
          onPressed: () {
            setCurrentPage(page);
          },
          splashRadius: 20,
          icon: Icon(page.icon, color: iconColor, size: iconSize)));
    }
    body.add(const Expanded(child: SizedBox()));
    return body;
  }
}
