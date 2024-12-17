import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingsController extends GetxController {
  var userName = 'Loading...'.obs;
  var userBio = 'Loading...'.obs;
  var userProfileImage = ''.obs;

  @override
  void onReady() {
    super.onReady();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get();

      if (userDoc.exists) {
        userName.value = userDoc['name'] ?? 'Unknown User';
        userBio.value = userDoc['bio'] ?? 'No bio available';
      } else {
        userName.value = 'User not found';
        userBio.value = 'Please try again later';
      }
    } catch (e) {
      userName.value = 'Failed to load user';
      userBio.value = 'Please try again later';
    }
  }
}
