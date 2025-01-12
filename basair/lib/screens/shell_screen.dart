import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShellScreen extends StatefulWidget {
  final Widget? child;
  const ShellScreen({super.key, this.child});

  @override
  _ShellScreenState createState() => _ShellScreenState();
}

class _ShellScreenState extends State<ShellScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 1);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        _onTabChanged(_tabController.index);
      }
    });
  }

  // Method to handle navigation when switching tabs
  void _onTabChanged(int index) {
    if (index == 1) {
      context.go('/'); // Navigate to Menu
    } else if (index == 0) {
      context.go('/topics'); // Navigate to Topics
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Stack(
          children: [
            const Center(child: Text("بصائر ")),
            Positioned(
              right: 0,
              child: TextButton(
                onPressed: () {
                  context.go('/login');
                },
                child: const Text(
                  'تسجيل دخول',
                  style: TextStyle(color: Colors.red, fontSize: 14, fontWeight: FontWeight.bold),
                )))
          ]),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'الموضوعات'),
            Tab(text: 'الفهرس'),
          ],
        ),
      ),
      body: widget.child,
    );
  }
}
