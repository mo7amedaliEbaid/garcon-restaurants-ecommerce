import 'package:flutter/material.dart';
import 'package:garcon/configs/configs.dart';
import 'package:garcon/presentation/widgets.dart';

class BookingView extends StatefulWidget {
  const BookingView({super.key});

  @override
  State<BookingView> createState() => _BookingViewState();
}

class _BookingViewState extends State<BookingView> {
  final TextEditingController _nameController = TextEditingController();
  List<String> dropDownItems = ["Select Branch", "1", "2"];
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Space.all(1, 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Customer Name",
            style: AppText.b1b,
          ),
          Space.yf(.5),
          customTextField(labelText: "Type here", controller: _nameController),
          Space.yf(1.5),
          Text(
            "Restaurant Branch",
            style: AppText.b1b,
          ),
          Space.yf(.5),
          Container(
            padding: Space.h1!,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.withOpacity(.5)),
              borderRadius: BorderRadius.circular(
                AppDimensions.normalize(4),
              ),
            ),
            child: DropdownButton(
                isExpanded: true,
                underline: const SizedBox.shrink(),
                value: "Select Branch",
                items:
                    dropDownItems.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {}),
          ),
          Space.yf(1.5),
          Text(
            "Booking Date",
            style: AppText.b1b,
          ),
          Space.yf(.5),
          Container(
            padding: Space.all(1.1, .7),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.withOpacity(.5)),
              borderRadius: BorderRadius.circular(
                AppDimensions.normalize(4),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(selectedDate.toString().substring(0, 10)),
                GestureDetector(
                  onTap: () {
                    _selectDate(context);
                  },
                  child: const Icon(
                    Icons.date_range,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
          Space.yf(1.5),
          Text(
            "Booking Time",
            style: AppText.b1b,
          ),
          Space.yf(.5),
          Container(
            padding: Space.all(1.1, .7),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.withOpacity(.5)),
              borderRadius: BorderRadius.circular(
                AppDimensions.normalize(4),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(selectedTime.format(context)),
                GestureDetector(
                  onTap: () {
                    _selectTime(context);
                  },
                  child: const Icon(
                    Icons.timelapse,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
