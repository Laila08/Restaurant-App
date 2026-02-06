// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../widgets/app_text_field.dart';
// import 'home.dart';
// import 'login_screen.dart';
// import 'package:easy_localization/easy_localization.dart';  // استيراد easy_localization
//
// class RegisterScreen extends StatefulWidget {
//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }
//
// class _RegisterScreenState extends State<RegisterScreen> {
//   final _formKey = GlobalKey<FormState>();
//
//   final emailController = TextEditingController();
//   final usernameController = TextEditingController();
//   final passwordController = TextEditingController();
//
//   List<String> _images = [
//     'assets/images/google.png',
//     'assets/images/facebook (1).png',
//     'assets/images/apple-logo.png'
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
//         child: SingleChildScrollView(
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "create_your_new_account".tr(),
//                   style: const TextStyle(
//                       letterSpacing: 1.5,
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 10),
//                 Text(
//                   "create_account_start_search_food".tr(),
//                   style: const TextStyle(color: Color(0xff878787)),
//                 ),
//                 const SizedBox(height: 20),
//                 Text(
//                   "email_address".tr(),
//                   style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
//                 ),
//                 const SizedBox(height: 10),
//                 CustomField(
//                   hint: "albertstevano_gmail".tr(),
//                   controller: emailController,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'please_enter_email'.tr();
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 12),
//                 Text(
//                   "user_name".tr(),
//                   style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
//                 ),
//                 const SizedBox(height: 10),
//                 CustomField(
//                   hint: "albert_stevano".tr(),
//                   controller: usernameController,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'please_enter_username'.tr();
//                     }
//                     return null;
//                   },
//                 ),
//                 Text(
//                   "password".tr(),
//                   style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
//                 ),
//                 const SizedBox(height: 10),
//                 CustomField(
//                   hint: "password".tr(),
//                   controller: passwordController,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'please_enter_password'.tr();
//                     }
//                     return null;
//                   },
//                   icon: Icons.visibility_off_outlined,
//                 ),
//                 Row(
//                   children: [
//                     Checkbox(
//                         value: true,
//                         activeColor: const Color(0xffFE8C00),
//                         onChanged: (val) {}),
//                     Expanded(
//                       child: Text.rich(
//                         TextSpan(
//                           children: [
//                             TextSpan(text: "i_agree_with".tr()),
//                             TextSpan(
//                               text: "terms_of_service".tr(),
//                               style: const TextStyle(color: Color(0xffFE8C00)),
//                             ),
//                             TextSpan(text: " and ".tr()),
//                             TextSpan(
//                               text: "privacy_policy".tr(),
//                               style: const TextStyle(color: Color(0xffFE8C00)),
//                             ),
//                           ],
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//                 const SizedBox(height: 18),
//                 SizedBox(
//                   width: 490,
//                   child: ElevatedButton(
//                     onPressed: () async {
//                       if (_formKey.currentState!.validate()) {
//                         SharedPreferences prefs =
//                         await SharedPreferences.getInstance();
//                         await prefs.setString('email', emailController.text.trim());
//                         await prefs.setString('username', usernameController.text.trim());
//                         await prefs.setString('password', passwordController.text.trim());
//
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                               backgroundColor: const Color(0xFFFE8C00),
//                               content: Text("account_saved_successfully".tr())),
//                         );
//                         Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => Home(),
//                             ));
//                       } else {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                               backgroundColor: Colors.red,
//                               content: Text("please_complete_all_fields".tr())),
//                         );
//                       }
//                     },
//                     child: Text('register'.tr(),
//                         style: const TextStyle(color: Colors.white)),
//                     style: ElevatedButton.styleFrom(
//                         padding: const EdgeInsets.symmetric(vertical: 25),
//                         backgroundColor: const Color(0xFFFE8C00),
//                         shape: const StadiumBorder()),
//                   ),
//                 ),
//                 const SizedBox(height: 24),
//                 Row(
//                   children: [
//                     const Expanded(
//                       child: Divider(
//                         color: Color(0xff878787),
//                         thickness: 1,
//                         endIndent: 8,
//                       ),
//                     ),
//                     Text(
//                       'or_sign_in_with'.tr(),
//                       style: const TextStyle(color: Color(0xff878787)),
//                     ),
//                     const Expanded(
//                       child: Divider(
//                         color: Color(0xff878787),
//                         thickness: 1,
//                         indent: 8,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 12),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: _images
//                       .map((img) => Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 4),
//                     child: _logoLogin(img),
//                   ))
//                       .toList(),
//                 ),
//                 const SizedBox(height: 16),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "dont_have_account".tr(),
//                       style: const TextStyle(
//                           fontWeight: FontWeight.w500, fontSize: 15),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => LoginScreen()));
//                       },
//                       child: Text(
//                         "sign_in".tr(),
//                         style: const TextStyle(color: Color(0xFFFE8C00)),
//                       ),
//                     )
//                   ],
//                 )
//               ],
//             ),
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
