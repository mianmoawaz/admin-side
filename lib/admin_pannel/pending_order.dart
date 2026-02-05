import 'package:ecommerce_app_admin_side/constant/app_colors.dart';
import 'package:flutter/material.dart';

class PendingOrdersScreen extends StatelessWidget {
  final List<Map<String, dynamic>> pendingOrders = [
    {"id": 1, "name": "Saim", "qty": 1, "address": "Near Meadows School"},
    {"id": 2, "name": "Ahmad", "qty": 2, "address": "Near Meadows School"},
    {"id": 3, "name": "Ali", "qty": 3, "address": "Lahore City"},
    {"id": 4, "name": "Asif", "qty": 2, "address": "Karachi"},
    {"id": 5, "name": "Kainat", "qty": 1, "address": "Islamabad"},
    {"id": 6, "name": "Huzaifa", "qty": 2, "address": "Rawalpindi"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              "All Pending Orders",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Table
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  headingRowColor: MaterialStateProperty.all(Colors.grey[200]),
                  border: TableBorder.all(color: Colors.grey.shade300),
                  columns: const [
                    DataColumn(label: Text("Sr No")),
                    DataColumn(label: Text("Product Name")),
                    DataColumn(label: Text("Qty")),
                    DataColumn(label: Text("Address")),
                    DataColumn(label: Text("Confirm")),
                  ],
                  rows: pendingOrders.map((order) {
                    return DataRow(
                      cells: [
                        DataCell(Text(order["id"].toString())),
                        DataCell(Text(order["name"])),
                        DataCell(Text(order["qty"].toString())),
                        DataCell(Text(order["address"])),
                        DataCell(Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Confirm Order logic
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                              ),
                              child: Text("Confirm",
                                  style:
                                      TextStyle(color: AppColors.whitecolor)),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: () {
                                // Delete Order logic
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                              ),
                              child: Text("Delete",
                                  style:
                                      TextStyle(color: AppColors.whitecolor)),
                            ),
                          ],
                        )),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
