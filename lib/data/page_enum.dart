import 'package:flutter/cupertino.dart';

// This order corresponds to the bottomNavigationBar page order!
enum Page {
  home(CupertinoIcons.person),
  search(CupertinoIcons.search),
  profile(CupertinoIcons.graph_circle);

  final IconData icon;
  const Page(this.icon);
}