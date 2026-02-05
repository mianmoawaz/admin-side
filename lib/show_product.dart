import 'package:ecommerce_app_admin_side/constant/app_colors.dart';
import 'package:flutter/material.dart';

class ShowAllCategory1 extends StatelessWidget {
  const ShowAllCategory1({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> categories = [
      {
        "image": "https://via.placeholder.com/50",
        "name": "Saim",
        "experience": "2 Years",
        "description": "Electrician",
      },
      {
        "image": "https://via.placeholder.com/50",
        "name": "Ahmad",
        "experience": "1 Year",
        "description": "Plumber",
      },
      {
        "image": "https://via.placeholder.com/50",
        "name": "Ali",
        "experience": "3 Years",
        "description": "Painter",
      },
      {
        "image": "https://via.placeholder.com/50",
        "name": "Zain",
        "experience": "6 Months",
        "description": "Carpenter",
      },
      {
        "image": "https://via.placeholder.com/50",
        "name": "Abid",
        "experience": "5 Years",
        "description": "Mechanic",
      },
      {
        "image": "https://via.placeholder.com/50",
        "name": "Asif",
        "experience": "4 Years",
        "description": "Welder",
      },
      {
        "image": "https://via.placeholder.com/50",
        "name": "Kainat",
        "experience": "2.5 Years",
        "description": "Tailor",
      },
      {
        "image": "https://via.placeholder.com/50",
        "name": "Huzaifa",
        "experience": "8 Months",
        "description": "Technician",
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.whitecolor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔍 Search bar
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 250,
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: AppColors.whitecolor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      )
                    ],
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search",
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // 🔶 Title
            const Text(
              "Show All Category",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.maincolor),
            ),
            const SizedBox(height: 20),

            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.whitecolor,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    )
                  ],
                ),
                child: SingleChildScrollView(
                  child: DataTable(
                    headingRowColor: MaterialStateProperty.all(
                      Colors.grey.shade100,
                    ),
                    columns: const [
                      DataColumn(label: Text("Category Image")),
                      DataColumn(label: Text("Name")),
                      DataColumn(label: Text("Experience")),
                      DataColumn(label: Text("Description")),
                      DataColumn(label: Text("Actions")),
                    ],
                    rows: categories.map((category) {
                      return DataRow(cells: [
                        DataCell(
                          ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.network(
                              category["image"]!,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        DataCell(Text(category["name"]!)),
                        DataCell(Text(category["experience"]!)),
                        DataCell(Text(category["description"]!)),
                        DataCell(Row(
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    // Dialog UI
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      content: SizedBox(
                                        width: 400,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Update Product",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors.maincolor),
                                            ),
                                            const SizedBox(height: 20),

                                            // Product Name
                                            TextField(
                                              decoration: const InputDecoration(
                                                labelText: "Product Name *",
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                            const SizedBox(height: 15),

                                            // Price
                                            TextField(
                                              decoration: const InputDecoration(
                                                labelText: "Price",
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                            const SizedBox(height: 15),

                                            // Description
                                            TextField(
                                              maxLines: 3,
                                              decoration: const InputDecoration(
                                                labelText: "Description",
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                            const SizedBox(height: 25),

                                            // Save button
                                            Center(
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(
                                                      context); // close dialog
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      AppColors.maincolor,
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 30,
                                                      vertical: 12),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                ),
                                                child: const Text(
                                                  "Update",
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.whitecolor),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              icon: const Icon(Icons.edit, size: 16),
                              label: const Text("Edit"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                minimumSize: const Size(80, 35),
                              ),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.delete, size: 16),
                              label: const Text("Delete"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                minimumSize: const Size(90, 35),
                              ),
                            ),
                          ],
                        )),
                      ]);
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
