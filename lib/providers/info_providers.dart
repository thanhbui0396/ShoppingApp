import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class InfoProviders extends ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  StreamController<double> loading = StreamController<double>.broadcast();
  Stream<double> get loadingStream => loading.stream;

  Future<void> getImage() async {
    final id = FirebaseAuth.instance.currentUser!.uid;
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final file = File(image.path);

      final metadata = SettableMetadata(contentType: "image/jpeg");

      final storageRef = FirebaseStorage.instance.ref();
      final mountainsRef = storageRef.child("images/$id");

      final uploadTask = mountainsRef.putFile(file, metadata);

      uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) async {
        switch (taskSnapshot.state) {
          case TaskState.running:
            final progress =
                (taskSnapshot.bytesTransferred / taskSnapshot.totalBytes);
            loading.add(progress);
            print("Upload is $progress% complete.");
            break;
          case TaskState.paused:
            print("Upload is paused.");
            break;
          case TaskState.canceled:
            print("Upload was canceled");
            break;
          case TaskState.error:
            // Handle unsuccessful uploads
            break;
          case TaskState.success:
            final img = await mountainsRef.getDownloadURL();
            users.doc(id).update({'avata': img.toString()}).catchError(
                (error) => print("Failed to update user: $error"));

            break;
        }
      });
    }
  }

  Future<void> addUser(String username, String uid) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');

    return users
        .doc(uid)
        .set({
          'username': username, // John Doe
          'uid': uid, // Stokes and Sons
          'avata': '', // 42
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  void dispose() {
    loading.close();
    super.dispose();
  }
}
