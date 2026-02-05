import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var categories = [].obs;

  Future<void> addCategory(String name, String description) async {
    try {
      await _firestore.collection('categories').add({
        'name': name,
        'description': description,
        'createdAt': DateTime.now(),
      });
      Get.snackbar("Success", "Category Added");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  void fetchCategories() {
    _firestore.collection('categories').snapshots().listen((event) {
      categories.value = event.docs.map((e) => e.data()).toList();
    });
  }

  Future<void> deleteCategory(String id) async {
    await _firestore.collection('categories').doc(id).delete();
    Get.snackbar("Deleted", "Category Removed");
  }
}
