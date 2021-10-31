// import 'package:coinbase/core/utils/values/colors.dart';
// import 'package:coinbase/core/utils/values/styles.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class BasePage extends StatelessWidget {
//   final Widget child;
//   final Widget leading;
//   final Widget trailing;
//   final Widget titleWidget;
//   final String title;
//   final Widget endDrawer;
//   final List<Widget> actions;
//
//   BasePage({
//     required this.leading,
//     required this.title,
//     required this.child,
//     required this.trailing,
//     required this.titleWidget,
//     required this.endDrawer,
//     required this.actions,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         titleSpacing: 20,
//         actions: actions ?? [Container()],
//         backgroundColor: AppColors.primaryBlue,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
//         ),
//         title: Row(
//           mainAxisSize: MainAxisSize.max,
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             leading,
//             SizedBox(width: 10),
//             titleWidget,
//             Spacer(),
//             trailing,
//           ],
//         ),
//       ),
//       endDrawer: endDrawer,
//       body: SafeArea(
//         bottom: false,
//         child: child,
//       ),
//     );
//   }
// }
// // (leading == null)
// // ? (Navigator.canPop(Get.context!))
// // ? InkWell(
// // customBorder: CircleBorder(),
// // onTap: Get.back,
// // child: const Icon(
// // Icons.arrow_back,
// // color: AppColors.white,
// // size: 36,
// // ),
// // )
// // : Container()
// //     :
