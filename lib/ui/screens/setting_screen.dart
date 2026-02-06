import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'home.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String selectedLanguage = 'English (US)';

  final List<Map<String, String>> languages = [
    {'name': 'Arabic', 'code': 'PS'},
    {'name': 'English (US)', 'code': 'US'},
  ];

  void _showLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: 400,
          child: Column(
            children: [
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'select_language'.tr(),
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: languages.length,
                  itemBuilder: (context, index) {
                    var lang = languages[index];
                    bool isSelected = lang['name'] == selectedLanguage;

                    return Container(
                      margin: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isSelected ? const Color(0xffFF9C44) : const Color(0xFFEAEAEA),
                          width: 1,
                        ),
                      ),
                      child: ListTile(
                        leading: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xffF3F6FB),
                          ),
                          child: Text(
                            Country.parse(lang['code']!).flagEmoji,
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                        title: Text(lang['name']!, style: const TextStyle(fontWeight: FontWeight.w600)),
                        trailing: isSelected
                            ? const Icon(Icons.check_circle, color: Colors.orange)
                            : null,
                        onTap: () async {
                          if (lang['code'] == 'PS') {
                            // Arabic
                            await context.setLocale(const Locale('ar'));
                            setState(() {
                              selectedLanguage = lang['name']!;
                            });
                            Navigator.pop(context);
                          } else if (lang['code'] == 'US') {
                            await context.setLocale(const Locale('en'));
                            setState(() {
                              selectedLanguage = lang['name']!;
                            });
                            Navigator.pop(context);
                          } else {
                          }
                        },
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 400,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('select'.tr(), style: const TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    backgroundColor: const Color(0xFFFE8C00),
                    shape: const StadiumBorder(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('settings'.tr(), style: const TextStyle(fontWeight: FontWeight.w600)),
        leading: IconButton(onPressed: () {Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        );}, icon: const Icon(Icons.arrow_back_ios)),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('profile'.tr(),
                style: const TextStyle(fontSize: 13, color: Color(0xFF878787), fontWeight: FontWeight.w600)),
          ),
          SwitchListTile(
            title: Text('push_notification'.tr(),
                style: const TextStyle(fontWeight: FontWeight.w600)),
            value: false,
            onChanged: (value) {},
          ),
          SwitchListTile(
            title: Text('location'.tr(),
                style: const TextStyle(fontWeight: FontWeight.w600)),
            value: true,
            onChanged: (value) {},
            thumbColor: MaterialStateProperty.all(Colors.white),
            trackColor: MaterialStateProperty.resolveWith<Color>(
                  (states) => states.contains(MaterialState.selected)
                  ? const Color(0xFFFE8C00)
                  : Colors.grey.shade300,
            ),
          ),
          ListTile(
            title: Text('language'.tr(),
                style: const TextStyle(fontWeight: FontWeight.w600)),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(selectedLanguage, style: const TextStyle(fontWeight: FontWeight.w600)),
                const Icon(Icons.arrow_forward_ios),
              ],
            ),
            onTap: _showLanguageBottomSheet,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('other'.tr(),
                style: const TextStyle(fontSize: 13, color: Colors.grey, fontWeight: FontWeight.w600)),
          ),
          ListTile(
            title: Text('about'.tr(),
                style: const TextStyle(fontWeight: FontWeight.w600)),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            title: Text('privacy'.tr(),
                style: const TextStyle(fontWeight: FontWeight.w600)),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            title: Text('terms'.tr(),
                style: const TextStyle(fontWeight: FontWeight.w600)),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}
