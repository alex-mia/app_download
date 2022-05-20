import 'package:flutter/material.dart';

class NewPages extends StatefulWidget {
  const NewPages({Key? key}) : super(key: key);

  @override
  State<NewPages> createState() => _NewPagesState();
}

class _NewPagesState extends State<NewPages> {

int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 8,
        title: Text('Page ${_pageIndex + 1}'),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.help),
          ),
        ],
      ),
      // drawer: Container(
      //   color: Colors.blue[600],
      //   margin: EdgeInsets.only(right: 220),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
                'Страница  ${_pageIndex + 1}',
                style: TextStyle(fontSize: 30),
              ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.flag), label: 'Tab1'),
          BottomNavigationBarItem(icon: Icon(Icons.help), label: 'Tab2'),
        ],
        currentIndex: _pageIndex,
        onTap: _onTap,
      ),
    );
  }
  void _onTap(index){
    setState(() {
      if(_pageIndex != index){
        _pageIndex = index;
      }
    });
  }
}




