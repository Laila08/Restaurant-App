import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../widgets/chat_widget.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> chatList = [
      {
        'name': 'Geopart Etdsien',
        'image': 'assets/images/d225a08066427d0d5f06284a4fd49d3538d49672.png',
        'time': '13.47'
      },
      {
        'name': 'Stevano Clirover',
        'image': 'assets/images/104f84ff3a2a8d65420949181f043fa5e73bd8c7.png',
        'time': '11.23'
      },
      {
        'name': 'Elisia Justin',
        'image': 'assets/images/6392c33e90defd2707cbb4cf5f9a63be9f9df0b3.jpg',
        'time': '11.23'
      },
      {
        'name': 'Geopart Etdsien',
        'image': 'assets/images/d225a08066427d0d5f06284a4fd49d3538d49672.png',
        'time': '13.47'
      },
      {
        'name': 'Stevano Clirover',
        'image': 'assets/images/104f84ff3a2a8d65420949181f043fa5e73bd8c7.png',
        'time': '13.47'
      },
      {
        'name': 'Elisia Justin',
        'image': 'assets/images/6392c33e90defd2707cbb4cf5f9a63be9f9df0b3.jpg',
        'time': '11.23'
      },
      {
        'name': 'Geopart Etdsien',
        'image': 'assets/images/d225a08066427d0d5f06284a4fd49d3538d49672.png',
        'time': '11.23'
      },
      {
        'name': 'Geopart Etdsien',
        'image': 'assets/images/d225a08066427d0d5f06284a4fd49d3538d49672.png',
        'time': '13.47'
      },
      {
        'name': 'Stevano Clirover',
        'image': 'assets/images/104f84ff3a2a8d65420949181f043fa5e73bd8c7.png',
        'time': '11.23'
      },
      {
        'name': 'Elisia Justin',
        'image': 'assets/images/6392c33e90defd2707cbb4cf5f9a63be9f9df0b3.jpg',
        'time': '11.23'
      },
      {
        'name': 'Geopart Etdsien',
        'image': 'assets/images/d225a08066427d0d5f06284a4fd49d3538d49672.png',
        'time': '13.47'
      },
      {
        'name': 'Stevano Clirover',
        'image': 'assets/images/104f84ff3a2a8d65420949181f043fa5e73bd8c7.png',
        'time': '13.47'
      },
      {
        'name': 'Elisia Justin',
        'image': 'assets/images/6392c33e90defd2707cbb4cf5f9a63be9f9df0b3.jpg',
        'time': '11.23'
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'chat_list'.tr(),
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'all_message'.tr(),
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: chatList.length,
              itemBuilder: (context, index) {
                final chat = chatList[index];
                final widget = index == 0 || index == 3
                    ? const Icon(Icons.done_all, color: Color(0xFFFE8C00))
                    : index == 1 || index == 4
                    ? const CircleAvatar(
                  radius: 12,
                  backgroundColor: Color(0xFFFE8C00),
                  child: Text('3', style: TextStyle(color: Colors.white)),
                )
                    : const Text('');

                return Padding(
                  padding: const EdgeInsets.only(top: 13.0),
                  child: ChatWidget(
                    widget: widget,
                    name: chat['name'],
                    subName: 'your_order_just_arrived'.tr(),
                    image: chat['image'],
                    time: chat['time'],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
