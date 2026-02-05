import 'package:ecommerce_app_admin_side/constant/app_colors.dart';
import 'package:flutter/material.dart';

class ShowAllCategories extends StatefulWidget {
  const ShowAllCategories({super.key});

  @override
  State<ShowAllCategories> createState() => _ShowAllCategoriesState();
}

class _ShowAllCategoriesState extends State<ShowAllCategories> {
  List<Map<String, String>> categories = [
    {"image": "assets/Logo-Main-01 copy 1.png", "name": "Chair"},
    {"image": "assets/Logo-Main-01 copy 1.png", "name": "Sofa"},
    {"image": "assets/Logo-Main-01 copy 1.png", "name": "Table"},
    {"image": "assets/Logo-Main-01 copy 1.png", "name": "Bed"},
    {"image": "assets/Logo-Main-01 copy 1.png", "name": "Cupboard"},
    {"image": "assets/Logo-Main-01 copy 1.png", "name": "Almirah"},
    {"image": "assets/Logo-Main-01 copy 1.png", "name": "Dressing"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // 🔹 TopBar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            color: AppColors.whitecolor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Show All Categories",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.maincolor,
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 250,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search...",
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 0),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    const CircleAvatar(
                      backgroundImage: AssetImage("assets/user.png"),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // 🔹 Table
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: DataTable(
                
                headingRowColor: MaterialStateColor.resolveWith(
                    (states) => Colors.grey[200]!),
                columns: const [
                  DataColumn(
                      label: Text("Category Image",
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text("Category Name",
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text("Actions",
                          style: TextStyle(fontWeight: FontWeight.bold))),
                ],
                rows: categories.map((cat) {
                  return DataRow(cells: [
                    DataCell(Image.asset(cat["image"]!, width: 50, height: 50)),
                    DataCell(Text(cat["name"]!)),
                    DataCell(Row(
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            _editCategory(cat);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.maincolor),
                          icon: const Icon(Icons.edit, size: 16),
                          label: const Text("Edit",
                              style: TextStyle(color: Colors.white)),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              categories.remove(cat);
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red),
                          icon: const Icon(Icons.delete, size: 16),
                          label: const Text("Delete",
                              style: TextStyle(color: AppColors.whitecolor)),
                        ),
                      ],
                    )),
                  ]);
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _editCategory(Map<String, String> category) {
    final TextEditingController nameController =
        TextEditingController(text: category["name"]);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Category"),
          content: TextField(
            controller: nameController,
            decoration: const InputDecoration(labelText: "Category Name"),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel")),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  category["name"] = nameController.text;
                });
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.maincolor,
              ),
              child: const Text("Save", style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }
}
