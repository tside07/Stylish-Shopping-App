// import 'package:flutter/material.dart';
// import 'package:stylish_shopping_app/core/theme/app_text_style.dart';

// class SectionButton extends StatelessWidget {
//   final Image background;
//   final Widget icon;
//   final Color iconColor;
//   final String title;
//   final String subtitle; 
//   final VoidCallback onTap;

//   const SectionButton({
//     super.key,
//     required this.background,
//     required this.icon,
//     required this.iconColor,
//     required this.title,
//     required this.subtitle,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: SizedBox(
//         width: double.infinity,
//         height: 84,
//         child: Column(
//           children: [

//             const SizedBox(height: 10),

//             Row(
//               children: [
//                 SizedBox(
//                   width: 50,
//                   height: 50,
//                   child: Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(8),
//                         child: background,
//                       ),
//                       Center(
//                         child: icon,
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(width: 15),

//                 Expanded(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         title,
//                         style: AppTextStyle.s15.copyWith(
//                           fontWeight: FontWeight.w400,
//                           color: const Color(0xff1D1E20),
//                         ),
//                       ),
//                       const SizedBox(height: 10),

//                       Text(
//                         subtitle,
//                         style: AppTextStyle.s15.copyWith(
//                           fontWeight: FontWeight.w400,
//                           color: const Color(0xff8F959E),
//                         ),
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                       const Icon(
//                         Icons.check_circle,
//                         color: Color(0xff4AC76D),
//                         size: 25,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
