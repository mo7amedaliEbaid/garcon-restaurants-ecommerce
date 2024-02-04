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
@override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Space.all(1,1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Customer Name"),
          Space.yf(),
          customTextField(labelText: "Type here", controller: _nameController),
          Space.yf(),
          const Text("Restaurant Branch"),
          Space.yf(),
          Container(
            padding: Space.h1!,
            decoration: BoxDecoration(
              border: Border.all(color:Colors.grey.withOpacity(.5)),
              borderRadius: BorderRadius.circular(
                AppDimensions.normalize(4),
              ),
            ),
            child: DropdownButton(
                isExpanded: true,
                underline: const SizedBox.shrink(),
                value: "Select Branch",
                items: dropDownItems.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {}),
          )
        ],
      ),
    );
  }
}
