// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';


// class SenderMainScreen extends HookWidget {
//   const SenderMainScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final selectedIndex = useState<int>(0);

//     List<Widget> pages = const [
//       SenderHomeScreen(),
//       SenderDeliveriesScreen(),
//       SenderBusinessScreen(),
//       SenderProfileScreen(),
//     ];

//     return Scaffold(
//       body: IndexedStack(
//         index: selectedIndex.value,
//         children: pages,
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: selectedIndex.value,
//         onTap: (value) {
//           selectedIndex.value = value;
//         },
//         enableFeedback: false,
//         backgroundColor: appColors.white,
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: appColors.blue,
//         unselectedItemColor: appColors.black,
//         showSelectedLabels: true,
//         showUnselectedLabels: true,
//         unselectedLabelStyle: TextStyle(
//           fontSize: 13.sp,
//           fontWeight: FontWeight.w500,
//           // color: appColors.black,
//         ),
//         selectedLabelStyle: TextStyle(
//           color: Theme.of(context).colorScheme.primary,
//           fontSize: 13.sp,
//           fontWeight: FontWeight.w500,
//         ),
//         items: [
//           BottomNavigationBarItem(
//             icon: SvgPicture.asset(homeOutlined),
//             label: 'Home',
//             activeIcon: SvgPicture.asset(homeFilled),
//           ),
//           BottomNavigationBarItem(
//             icon: SvgPicture.asset(ordersOutlined),
//             label: 'Delivery',
//             activeIcon: SvgPicture.asset(ordersFilled),
//           ),
//           BottomNavigationBarItem(
//             icon: SvgPicture.asset(businessOutlined),
//             label: 'Business',
//             activeIcon: SvgPicture.asset(businessFilled),
//           ),
//           BottomNavigationBarItem(
//             icon: SvgPicture.asset(profileOutlined),
//             label: 'Profile',
//             activeIcon: SvgPicture.asset(profileFilled),
//           ),
//         ],
//       ),
//     );
//   }
// }
