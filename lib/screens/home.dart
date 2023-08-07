import 'package:callme/common/widgets/call_invitation.dart';
import 'package:callme/common/widgets/user_card.dart';
import 'package:callme/models/user_model.dart';
import 'package:callme/services/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return CallInvitationPage(
      userName: FirebaseService.currentUser!.userName,
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseService.buildViews,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final List<QueryDocumentSnapshot>? docs = snapshot.data?.docs;
                    if (docs == null || docs.isEmpty) {
                      return const Text('No Data');
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: docs.length,
                      itemBuilder: (context, index) {
                        final model = UserModel.fromJson(
                            docs[index].data() as Map<String, dynamic>);
                        if (model.userName !=
                            FirebaseService.currentUser?.userName) {
                          return UserCard(userModel: model);
                        }
                        return const SizedBox.shrink();
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
