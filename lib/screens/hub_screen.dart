// import 'package:flutter/material.dart';

// class HubScreen extends StatefulWidget {
//   const HubScreen({super.key});
  

//   @override
//   State<HubScreen> createState() => _HubScreenState();
// }

// class _HubScreenState extends State<HubScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Expanded(child: selectedIndex == 2
//               ? SlideTransition(
//                   position: _slideAnimation,
//                   child: _screens[_selectedIndex],
//                 )
//               : _screens[_selectedIndex],
//         ),
//         Container(
//           height: 80,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(
//                 color: const Color(0x1D1E2014),
//                 blurRadius: 20,
//                 offset: const Offset(0, -4),
//               ),
//             ],
//           ),
//           child: BottomNavigationBar(
//             currentIndex: _selectedIndex,
//             onTap: _onItemTapped,
//             type: BottomNavigationBarType.fixed,
//             selectedItemColor: const Color(0xff9775FA),
//             unselectedItemColor: const Color(0xff8F959E),
//             showSelectedLabels: false,
//             showUnselectedLabels: false,
//             elevation: 0,
//             backgroundColor: Colors.transparent,
//             items: [
//               BottomNavigationBarItem(
//                 icon: _selectedIndex == 0
//                     ? Text(
//                         'Home',
//                         style: AppTextStyle.s11.copyWith(
//                           color: const Color(0xff9775FA),
//                           fontWeight: FontWeight.w500,
//                         ),
//                       )
//                     : SvgPicture.asset(
//                         'assets/icons/app_icons/Home.svg',
//                         width: 20,
//                         height: 20,
//                         colorFilter: const ColorFilter.mode(
//                           Color(0xff8F959E),
//                           BlendMode.srcIn,
//                         ),
//                       ),
//                 label: '',
//               ),
//               BottomNavigationBarItem(
//                 icon: _selectedIndex == 1
//                     ? Text(
//                         'Wishlist',
//                         style: AppTextStyle.s11.copyWith(
//                           color: const Color(0xff9775FA),
//                           fontWeight: FontWeight.w500,
//                         ),
//                       )
//                     : SvgPicture.asset(
//                         'assets/icons/app_icons/Heart.svg',
//                         width: 20,
//                         height: 20,
//                         colorFilter: const ColorFilter.mode(
//                           Color(0xff8F959E),
//                           BlendMode.srcIn,
//                         ),
//                       ),
//                 label: '',
//               ),
//               BottomNavigationBarItem(
//                 icon: _selectedIndex == 2
//                     ? Text(
//                         'Cart',
//                         style: AppTextStyle.s11.copyWith(
//                           color: const Color(0xff9775FA),
//                           fontWeight: FontWeight.w500,
//                         ),
//                       )
//                     : SvgPicture.asset(
//                         'assets/icons/app_icons/Bag.svg',
//                         width: 20,
//                         height: 20,
//                         colorFilter: const ColorFilter.mode(
//                           Color(0xff8F959E),
//                           BlendMode.srcIn,
//                         ),
//                       ),
//                 label: '',
//               ),
//               BottomNavigationBarItem(
//                 icon: _selectedIndex == 3
//                     ? Text(
//                         'My Cards',
//                         style: AppTextStyle.s11.copyWith(
//                           color: const Color(0xff9775FA),
//                           fontWeight: FontWeight.w500,
//                         ),
//                       )
//                     : SvgPicture.asset(
//                         'assets/icons/app_icons/Wallet.svg',
//                         width: 20,
//                         height: 20,
//                         colorFilter: const ColorFilter.mode(
//                           Color(0xff8F959E),
//                           BlendMode.srcIn,
//                         ),
//                       ),
//                 label: '',
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }