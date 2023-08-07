import'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

class CallInvitationPage extends StatelessWidget {
  const CallInvitationPage({super.key,required this.child,required this.userName});

  final Widget child;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCallWithInvitation(
    appID: 1692927163,
    appSign: '418c16c3533d29eb1543932c3509c2422e9248bc4fc4a529aed21b170f39b150',
    userID: userName,
    userName: userName,
    plugins: [ZegoUIKitSignalingPlugin()],
    child: child,
  );
  
  }
}