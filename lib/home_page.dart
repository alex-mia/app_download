import 'package:flutter/material.dart';
import 'new_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Container(
            child: NewPage(),
          ),
          ),
          Expanded(child: Container(
            color: Colors.red,
            child: Center(
              child: ElevatedButton(
                onPressed: ageState.getResponse, child: Text('Push me'),
              ),
            ),
          ))
        ],
      ),
    );
  }
}

