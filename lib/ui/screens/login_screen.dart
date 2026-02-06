// import 'package:flutter/material.dart';
// import 'package:food_delivery/ui/screens/register_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../widgets/app_text_field.dart';
// import 'package:easy_localization/easy_localization.dart';
//
// import 'home.dart'; // استيراد easy_localization
//
// class LoginScreen extends StatelessWidget {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//
//   final List<String> _images = [
//     'assets/images/google.png',
//     'assets/images/facebook (1).png',
//     'assets/images/apple-logo.png'
//   ];
//
//   LoginScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "login_to_your_account".tr(),
//                 style: const TextStyle(
//                     letterSpacing: 1.5,
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 10),
//               Text(
//                 "please_sign_in_to_your_account".tr(),
//                 style: const TextStyle(color: Color(0xff878787)),
//               ),
//               const SizedBox(height: 20),
//               Text(
//                 "email_address".tr(),
//                 style:
//                     const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
//               ),
//               const SizedBox(height: 10),
//               CustomField(
//                 hint: "albertstevano_gmail".tr(),
//                 controller: emailController,
//                 validator: (x) => null,
//               ),
//               const SizedBox(height: 12),
//               Text(
//                 "password".tr(),
//                 style:
//                     const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
//               ),
//               const SizedBox(height: 10),
//               AppTextField(
//                 labelText: "password".tr(),
//                 controller: passwordController,
//                 validator: (x) => null,
//                 suffixIcon: Icon(Icons.visibility_off_outlined),
//                 textInputAction: ,
//               ),
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: TextButton(
//                   onPressed: () {},
//                   child: Text(
//                     "forgot_password".tr(),
//                     style: const TextStyle(color: Colors.orange),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 18),
//               SizedBox(
//                 width: 490,
//                 child: ElevatedButton(
//                   onPressed: () async {
//                     SharedPreferences prefs =
//                         await SharedPreferences.getInstance();
//                     String? savedEmail = prefs.getString('email');
//                     String? savedPassword = prefs.getString('password');
//
//                     if (savedEmail == emailController.text.trim() &&
//                         savedPassword == passwordController.text.trim()) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           backgroundColor: Colors.green,
//                           content: Text("login_successful".tr()),
//                         ),
//                       );
//                       Navigator.pushReplacement(context,
//                           MaterialPageRoute(builder: (context) => Home()));
//                     } else {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           backgroundColor: Colors.red,
//                           content: Text(
//                               "invalid_email_or_password".tr()),
//                         ),
//                       );
//                     }
//                   },
//                   child: Text(
//                     'sign_in'.tr(),
//                     style: const TextStyle(color: Colors.white),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(vertical: 25),
//                       backgroundColor: const Color(0xFFFE8C00),
//                       shape: const StadiumBorder()),
//                 ),
//               ),
//               const SizedBox(height: 24),
//               Row(
//                 children: [
//                   const Expanded(
//                     child: Divider(
//                       color: Color(0xff878787),
//                       thickness: 1,
//                       endIndent: 8,
//                     ),
//                   ),
//                   Text(
//                     'or_sign_in_with'.tr(),
//                     style: const TextStyle(color: Color(0xff878787)),
//                   ),
//                   const Expanded(
//                     child: Divider(
//                       color: Color(0xff878787),
//                       thickness: 1,
//                       indent: 8,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 12),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: _images
//                     .map((img) => Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 4),
//                           child: _logoLogin(img),
//                         ))
//                     .toList(),
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "dont_have_account".tr(),
//                     style: const TextStyle(
//                         fontWeight: FontWeight.w500, fontSize: 15),
//                   ),
//                   InkWell(
//                     onTap: () {
//                       Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => RegisterScreen()));
//                     },
//                     child: Text(
//                       "register".tr(),
//                       style: const TextStyle(color: Color(0xFFFE8C00)),
//                     ),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _logoLogin(String img) {
//     return Container(
//       padding: const EdgeInsets.all(2),
//       decoration: const BoxDecoration(
//         color: Color(0xffD6D6D6),
//         shape: BoxShape.circle,
//       ),
//       child: CircleAvatar(
//         backgroundColor: Colors.white,
//         radius: 20,
//         child: Image.asset(img, height: 20, width: 20),
//       ),
//     );
//   }
// }
