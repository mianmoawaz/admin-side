import 'package:ecommerce_app_admin_side/constant/app_colors.dart';
import 'package:flutter/material.dart';

class OrderManagementPage extends StatefulWidget {
  const OrderManagementPage({super.key});

  @override
  State<OrderManagementPage> createState() => _OrderManagementPageState();
}

class _OrderManagementPageState extends State<OrderManagementPage> {
  String selectedStatus = "Pending";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Order Management",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          // Dropdown
          Row(
            children: [
              const Text("Select Order Status:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              const SizedBox(width: 20),
              DropdownButton<String>(
                value: selectedStatus,
                items: const [
                  DropdownMenuItem(
                      value: "Pending", child: Text("Pending Orders")),
                  DropdownMenuItem(
                      value: "Delivered", child: Text("Delivered Orders")),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedStatus = value!;
                  });
                },
              ),
            ],
          ),

          const SizedBox(height: 30),

          // Orders List (Dummy for now)
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    title: Text("$selectedStatus Order #${index + 1}"),
                    subtitle: Text(
                        "Details of ${selectedStatus.toLowerCase()} order ${index + 1}"),
                    trailing: Icon(
                      selectedStatus == "Pending"
                          ? Icons.pending_actions
                          : Icons.check_circle,
                      color: selectedStatus == "Pending"
                          ? AppColors.maincolor
                          : Colors.green,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
