import 'package:ecommerce_app_admin_side/constant/app_colors.dart';
import 'package:flutter/material.dart';

class DeliveredOrdersScreen extends StatelessWidget {
  final List<Map<String, dynamic>> deliveredOrders = [
    {
      "id": 1,
      "name": "Saim",
      "booked": "Plumber",
      "address": "Near Meadows School",
      "amount": 2000
    },
    {
      "id": 2,
      "name": "Ahmad",
      "booked": "Plumber",
      "address": "Plumber Town",
      "amount": 1500
    },
    {
      "id": 3,
      "name": "Ali",
      "booked": "Plumber",
      "address": "Lahore City",
      "amount": 1800
    },
    {
      "id": 4,
      "name": "Zain",
      "booked": "Plumber",
      "address": "Karachi",
      "amount": 2200
    },
    {
      "id": 5,
      "name": "Obaid",
      "booked": "Plumber",
      "address": "Islamabad",
      "amount": 1700
    },
    {
      "id": 6,
      "name": "Asif",
      "booked": "Plumber",
      "address": "Rawalpindi",
      "amount": 1400
    },
    {
      "id": 7,
      "name": "Kainat",
      "booked": "Plumber",
      "address": "Faisalabad",
      "amount": 1900
    },
    {
      "id": 8,
      "name": "Huzaifa",
      "booked": "Plumber",
      "address": "Multan",
      "amount": 2100
    },
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
              "All Delivered Orders",
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
                    DataColumn(label: Text("Name")),
                    DataColumn(label: Text("Booked")),
                    DataColumn(label: Text("Address")),
                    DataColumn(label: Text("Amount")),
                    DataColumn(label: Text("Delete")),
                  ],
                  rows: deliveredOrders.map((order) {
                    return DataRow(
                      cells: [
                        DataCell(Text(order["id"].toString())),
                        DataCell(Text(order["name"])),
                        DataCell(Text(order["booked"])),
                        DataCell(Text(order["address"])),
                        DataCell(Text(order["amount"].toString())),
                        DataCell(
                          ElevatedButton(
                            onPressed: () {
                              // Delete order logic
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                            ),
                            child: Text("Delete",
                                style: TextStyle(color: AppColors.whitecolor)),
                          ),
                        ),
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
