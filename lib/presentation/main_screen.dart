import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:family_memo_app/components/button.dart';
import 'package:family_memo_app/presentation/add_task_screen.dart';
import 'package:family_memo_app/services/theme_service.dart';
import 'package:family_memo_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  DateTime _selectedValue = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: [
          _addTaskBar(),
          _addDateBar(),
        ],
      ),
    );
  }

  _addDateBar() {
    return DatePicker(
      DateTime.now(),
      height: 80,
      width: 80,
      initialSelectedDate: DateTime.now(),
      selectionColor: bluish,
      selectedTextColor: Colors.white,
      onDateChange: (date) {
        setState(() {
          _selectedValue = date;
        });
      },
    );
  }

  _addTaskBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat.yMMMMd().format(DateTime.now()),
                  style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey)),
                ),
                const Text(
                  "Today",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Button(
              label: "+ 할 일 추가",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddTaskScreen()),
                );
              }),
        ],
      ),
    );
  }

  _appBar() {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.yellow,
      title: const Text('우리 가족 회의 앱',
          style: TextStyle(color: bluish, fontWeight: FontWeight.bold)),
      leading: GestureDetector(
        onTap: () {
          ThemeService().switchTheme();
        },
        child: const Icon(
          Icons.nightlight_outlined,
          size: 20,
          color: bluish,
        ),
      ),
      actions: const [
        CircleAvatar(
          backgroundImage: AssetImage("assets/profile.png"),
        ),
        SizedBox(width: 20),
      ],
    );
  }
}
