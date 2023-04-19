import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: CupertinoNavigationBar(
        middle: CupertinoTextField(),
        trailing: Icon(
          CupertinoIcons.check_mark,
          color: Colors.white,
          size: 20,
        ),
      ),
      body: Container(),
    );
  }
}
