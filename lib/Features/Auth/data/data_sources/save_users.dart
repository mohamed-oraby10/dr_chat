import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_dr_chat_application/Features/Auth/data/models/user_model.dart';
import 'package:new_dr_chat_application/core/utils/constants.dart';

void saveUsers({required UserCredential user}) async {
  final userModel = UserModel(
    uid: user.user!.uid,
    name: user.user?.displayName ?? user.user?.email?.split('@')[0],
    email: user.user?.email,
  );
  await FirebaseFirestore.instance
      .collection(kUsers)
      .doc(user.user!.uid)
      .set(userModel.toJson(), SetOptions(merge: true));
}
