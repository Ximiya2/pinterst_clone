import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black54,
        title: TextFormField(
          decoration: InputDecoration(
            fillColor: Colors.grey.shade700,
            filled: true,
            border: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(30)
            ),
            prefixIcon: const Icon(Icons.search, color: Colors.grey,),
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.grey),
            suffixIcon: Icon(Icons.camera_alt,color: Colors.grey,),
          ),
        ),
      ),
    );
  }
}
