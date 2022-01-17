import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/about.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';
import 'package:flutter_complete_guide/widgets/no_reports_sanitation_item_exist.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/reports_sanitation_item.dart';
import '../dummy_data.dart';

class AboutScreen extends StatelessWidget {
  static const routeName = '/about';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("אודות"),
        ),
        drawer: MainDrawer(),
        body: About());
  }
}
