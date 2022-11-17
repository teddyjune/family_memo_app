import 'package:family_memo_app/components/input_field.dart';
import 'package:family_memo_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  DateTime _selectedDate = DateTime.now();
  String endTime = "9:30 PM";
  String startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "할 일 추가",
              style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              )),
            ),
            const InputField(title: "Title", hint: "Enter your title"),
            const InputField(title: "Note", hint: "Enter your Note"),
            InputField(
              title: "Date",
              hint: DateFormat.yMd().format(_selectedDate),
              widget: IconButton(
                icon: const Icon(
                  Icons.calendar_month_outlined,
                  color: Colors.grey,
                ),
                onPressed: () {
                  _getDateFromUser();
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: InputField(
                  title: "Start Time",
                  hint: startTime,
                  widget: IconButton(
                    onPressed: () {
                      _getTimeFromUser(isStartTime: true);
                    },
                    icon: const Icon(
                      Icons.access_time_rounded,
                      color: Colors.grey,
                    ),
                  ),
                )),
                Expanded(
                    child: InputField(
                  title: "End Time",
                  hint: endTime,
                  widget: IconButton(
                    onPressed: () {
                      _getTimeFromUser(isStartTime: false);
                    },
                    icon: const Icon(
                      Icons.access_time_rounded,
                      color: Colors.grey,
                    ),
                  ),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _getDateFromUser() async {
    DateTime? _pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2023),
    );
    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
      });
    } else {
      print("it's null or something is wrong");
    }
  }

  _getTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker();
    if (!mounted) return;
    String _formatedTime = pickedTime.format(context);
    if (pickedTime == null) {
      print("Time canceled");
    } else if (isStartTime == true) {
      setState(() {
        startTime = _formatedTime;
      });
    } else if (isStartTime == false) {
      setState(() {
        endTime = _formatedTime;
      });
    }
  }

  _showTimePicker() {
    return showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: TimeOfDay(
          //_startTime --> 10:30 AM(string format)
          hour: int.parse(startTime.split(":")[0]),
          minute: int.parse(startTime.split(":")[1].split(' ')[0])),
    );
  }

  _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.white,
      title: const Text('우리 가족 회의 앱',
          style: TextStyle(color: bluish, fontWeight: FontWeight.bold)),
      leading: GestureDetector(
        onTap: () {},
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
