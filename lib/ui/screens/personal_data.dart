import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easy_localization/easy_localization.dart';

import '../widgets/app_text_field.dart';

class PersonalData extends StatefulWidget {
  const PersonalData({super.key});

  @override
  State<PersonalData> createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  String name = '';
  String dob = '';
  String gender = '';
  String phone = '';
  String email = '';

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  void loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = _getValueOrDefault(prefs.getString('username'), 'Albert Stevano Bajefski');
      dob = _getValueOrDefault(prefs.getString('dob'), '19/06/1999');
      gender = _getValueOrDefault(prefs.getString('gender'), 'Male');
      phone = _getValueOrDefault(prefs.getString('phone'), '+1 325-433-7656');
      email = _getValueOrDefault(prefs.getString('email'), 'Albertstevano@gmail.com');
    });
  }

  String _getValueOrDefault(String? value, String fallback) {
    if (value != null && value.trim().isNotEmpty) {
      return value;
    }
    return fallback;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
        title: Text(
          'personal_data'.tr(),
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/0e85bfb125d2f280563593cd69aaed5ee5e4eadb.png'),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          color: Color(0xFFFE8C00),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 25),
                _cardInfo('full_name'.tr(), name),
                _cardInfo('date_of_birth'.tr(), dob),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'gender'.tr(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    AppTextField(
                      validator: () {},
                      labelText: gender,
                      suffixIcon:Icon( Icons.keyboard_arrow_down),
                    ),
                  ],
                ),
                _cardInfo('phone'.tr(), phone),
                _cardInfo('email'.tr(), email),
                SizedBox(
                  width: 400,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'save'.tr(),
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 25),
                      backgroundColor: Color(0xFFFE8C00),
                      shape: StadiumBorder(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _cardInfo(String title, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        AppTextField(
          validator: () {},
          labelText: hint,
        ),
      ],
    );
  }
}
