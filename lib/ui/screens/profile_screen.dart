import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easy_localization/easy_localization.dart';
import 'login_screen.dart';
import 'personal_data.dart';
import 'setting_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? _username;
  String? _email;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username') ?? 'Unknown User';
      _email = prefs.getString('email') ?? 'No Email';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'profile_settings'.tr(),
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 30),
            Stack(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                      'assets/images/0e85bfb125d2f280563593cd69aaed5ee5e4eadb.png'),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      color: Color(0xFFFE8C00),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 15),
            Text(
              _username ?? '',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.7,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              _email ?? '',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xff878787),
              ),
            ),
            const SizedBox(height: 15),
            const Divider(
              thickness: 3.0,
              height: 0,
              color: Color(0xFFEDEDED),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'profile'.tr(),
                style: const TextStyle(color: Color(0xFF878787)),
              ),
            ),
            const SizedBox(height: 10),
            _cardWidget(
              title: 'personal_data'.tr(),
              leadingicon: Icons.person_outline,
              Icontrailing: Icons.arrow_forward_ios,
              fun: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const PersonalData()));
              },
            ),
            _cardWidget(
              title: 'settings'.tr(),
              leadingicon: Icons.settings_outlined,
              Icontrailing: Icons.arrow_forward_ios,
              fun: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsScreen()));
              },
            ),
            _cardWidget(
              title: 'extra_card'.tr(),
              leadingicon: Icons.payment,
              Icontrailing: Icons.arrow_forward_ios,
              fun: () {},
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'support'.tr(),
                style: const TextStyle(color: Color(0xFF878787)),
              ),
            ),
            _cardWidget(
              title: 'help_center'.tr(),
              leadingicon: Icons.info_outline,
              Icontrailing: Icons.arrow_forward_ios,
              fun: () {},
            ),
            _cardWidget(
              title: 'request_account_deletion'.tr(),
              leadingicon: Icons.delete_outline_rounded,
              Icontrailing: Icons.arrow_forward_ios,
              fun: () {},
            ),
            _cardWidget(
              title: 'add_another_account'.tr(),
              leadingicon: Icons.person_add_alt,
              Icontrailing: Icons.arrow_forward_ios,
              fun: () {},
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 400,
              child: ElevatedButton(
                onPressed: () async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  // await prefs.clear();
                 // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  LoginScreen()));
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  backgroundColor: Colors.white,
                  shape: const StadiumBorder(
                    side: BorderSide(color: Color(0xFFD6D6D6)),
                  ),
                  shadowColor: Colors.black.withOpacity(0.3),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.logout, color: Color(0xFFF14141)),
                    const SizedBox(width: 7),
                    Text(
                      'sign_out'.tr(),
                      style: const TextStyle(
                        color: Color(0xFFF14141),
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardWidget({
    required String title,
    required IconData leadingicon,
    required IconData Icontrailing,
    required Function fun,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: () => fun(),
          child: ListTile(
            title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
            leading: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFFF5F5FF),
              ),
              child: Icon(leadingicon),
            ),
            trailing: Icon(Icontrailing),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
