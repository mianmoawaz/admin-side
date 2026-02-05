import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addProduct(
      String name, double price, String description, File image) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      UploadTask uploadTask =
          FirebaseStorage.instance.ref('products/$fileName').putFile(image);
      TaskSnapshot snapshot = await uploadTask;
      String imageUrl = await snapshot.ref.getDownloadURL();

      await _firestore.collection('products').add({
        'name': name,
        'price': price,
        'description': description,
        'image': imageUrl,
        'createdAt': DateTime.now(),
      });
      Get.snackbar("Success", "Product Added");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
