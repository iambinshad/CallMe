import 'package:callme/models/user_model.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class UserCard extends StatefulWidget {
  final UserModel userModel;
  UserCard({required this.userModel, super.key});

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 75,
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.5),
          boxShadow: [
            BoxShadow(
                offset: Offset(10, 20),
                blurRadius: 10,
                spreadRadius: 0,
                color: Colors.grey.withOpacity(.05))
          ]),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            radius: 25,
            child: Center(
              child: Text(widget.userModel.name.substring(0, 1).toUpperCase()),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            widget.userModel.name,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 19),
          ),
          Spacer(),
          //audio call button
          actinoButton(false),
          // video call button
          actinoButton(true)
        ],
      ),
    );
  }

  ZegoSendCallInvitationButton actinoButton(bool isVideo) =>
      ZegoSendCallInvitationButton(
        invitees: [
          ZegoUIKitUser(
              id: widget.userModel.userName, name: widget.userModel.name)
        ],
        isVideoCall: isVideo,
        resourceID: "zegouikit_call",
      );
}
