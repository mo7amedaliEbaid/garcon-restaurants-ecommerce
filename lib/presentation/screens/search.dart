import 'package:flutter/material.dart';
import 'package:garcon/presentation/widgets.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: ""),
      body: Column(
        children: [
          customTextField(labelText: "", controller: _searchController)
        ],
      ),
    );
  }
}
