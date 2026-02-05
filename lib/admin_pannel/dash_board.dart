import 'package:ecommerce_app_admin_side/constant/app_colors.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _categoryController = TextEditingController();
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _priceController = TextEditingController();
    final TextEditingController _descriptionController =
        TextEditingController();

    // ✅ Add Category Dialog
    void _showAddCategoryDialog() {
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Container(
              padding: const EdgeInsets.all(20),
              width: 400,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Add Categories",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.maincolor,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _categoryController,
                    decoration: const InputDecoration(
                      labelText: "Categories Name *",
                      hintText: "Name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        String category = _categoryController.text.trim();
                        if (category.isNotEmpty) {
                          print("Category Added: $category");
                          Navigator.pop(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.maincolor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Add Categories",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    // ✅ Add Product Dialog
    void _showAddProductDialog() {
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Container(
              padding: const EdgeInsets.all(20),
              width: 450,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Add Product",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.maincolor),
                  ),
                  const SizedBox(height: 20),

                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: "Product Name *",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Product Price
                  TextField(
                    controller: _priceController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Price *",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Product Description
                  TextField(
                    controller: _descriptionController,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      labelText: "Description *",
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        String name = _nameController.text.trim();
                        String price = _priceController.text.trim();
                        String description = _descriptionController.text.trim();

                        if (name.isNotEmpty &&
                            price.isNotEmpty &&
                            description.isNotEmpty) {
                          print("Product Added: $name | $price | $description");
                          Navigator.pop(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.maincolor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Add Product",
                        style: TextStyle(
                          color: AppColors.whitecolor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return Column(
      children: [
        // ✅ Top Header
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Dashboard",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
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
                        contentPadding: const EdgeInsets.symmetric(vertical: 0),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  const CircleAvatar(
                    backgroundImage:
                        AssetImage("assets/Logo-Main-01 copy 1.png"),
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        // ✅ Stats + Buttons
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // Stats Section
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: const [
                    _StatsCard(
                        title: "Total User", value: "17", icon: Icons.people),
                    _StatsCard(
                        title: "Total Order",
                        value: "17",
                        icon: Icons.shopping_cart),
                    _StatsCard(
                        title: "Total Amount",
                        value: "400007",
                        icon: Icons.attach_money),
                    _StatsCard(
                        title: "Pending Order",
                        value: "17",
                        icon: Icons.pending),
                  ],
                ),

                const SizedBox(height: 40),

                // ✅ Buttons Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _ActionButton(
                      label: "Add Categories",
                      onPressed: _showAddCategoryDialog,
                    ),
                    const SizedBox(width: 20),
                    _ActionButton(
                      label: "Add Product",
                      onPressed: _showAddProductDialog,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ✅ Stats Card
class _StatsCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _StatsCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 90,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.maincolor),
        borderRadius: BorderRadius.circular(12),
        color: AppColors.whitecolor,
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.maincolor, size: 28),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.maincolor,
                  )),
              Text(value,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ],
          ),
        ],
      ),
    );
  }
}

// ✅ Action Button
class _ActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const _ActionButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.maincolor,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 3,
      ),
      icon: const Icon(Icons.add, color: Colors.white),
      label: Text(
        label,
        style: const TextStyle(
          color: AppColors.whitecolor,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }
}
