// dashboard_screen.dart
import 'package:flutter/material.dart';
import 'my_reccos_tab.dart';
import 'make_a_recco_tab.dart';
import 'edit_profile_tab.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Reccos Dashboard'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'My Reccos'),
              Tab(text: 'Make a Recco'),
              Tab(text: 'Edit Profile'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            MyReccosTab(),
            MakeAReccoTab(),
            EditProfileTab(),
          ],
        ),
      ),
    );
  }
}
