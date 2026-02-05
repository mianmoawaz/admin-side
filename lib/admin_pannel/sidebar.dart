import 'package:ecommerce_app_admin_side/admin_pannel/dash_board.dart';
import 'package:ecommerce_app_admin_side/admin_pannel/delieverd_order.dart';
import 'package:ecommerce_app_admin_side/admin_pannel/order_management.dart';
import 'package:ecommerce_app_admin_side/admin_pannel/pending_order.dart';
import 'package:ecommerce_app_admin_side/admin_pannel/show_category.dart';
import 'package:ecommerce_app_admin_side/constant/app_colors.dart';
import 'package:ecommerce_app_admin_side/show_product.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AdminPanel());
}

class AdminPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin Panel',
      debugShowCheckedModeBanner: false,
      home: AdminHome(),
    );
  }
}

class AdminHome extends StatefulWidget {
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  int _selectedIndex = 0;
  bool _orderDropdownOpen = false;

  final List<Widget> _screens = [
    DashboardPage(),
    ShowAllCategories(),
    ShowAllCategory1(),
    OrderManagementPage(),
    DeliveredOrdersScreen(),
    PendingOrdersScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 220,
            height: double.infinity,
            color: AppColors.maincolor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                buildMenuItem(Icons.dashboard, "Dashboard", 0),
                buildMenuItem(Icons.category, "Show Categories", 1),
                buildMenuItem(Icons.engineering, "Show All Product", 2),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _orderDropdownOpen = !_orderDropdownOpen;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.list_alt, color: Colors.white),
                        SizedBox(width: 10),
                        Text(
                          "Order Management",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        Icon(
                            _orderDropdownOpen
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: AppColors.whitecolor)
                      ],
                    ),
                  ),
                ),
                if (_orderDropdownOpen) ...[
                  buildSubMenuItem("Delivered Orders", 4),
                  buildSubMenuItem("Pending Orders", 5),
                ],
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey[100],
              child: _screens[_selectedIndex],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuItem(IconData icon, String title, int index) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.whitecolor : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(icon,
                color: isSelected ? AppColors.maincolor : AppColors.whitecolor),
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? AppColors.black : AppColors.whitecolor,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSubMenuItem(String title, int index) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(left: 40, top: 5, bottom: 5, right: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.whitecolor : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(Icons.circle,
                size: 10,
                color: isSelected ? AppColors.maincolor : AppColors.whitecolor),
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? AppColors.black : AppColors.whitecolor,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
