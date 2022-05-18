import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final ageState = NewPageState();

class NewPage extends StatefulWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  State<NewPage> createState() {
    return ageState;
  }
}

class NewPageState extends State<NewPage> {
  late MainPageState state;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    state = DefaultState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Center(
          child: buildBody(),
        ),
      ),
    );
  }

  Widget buildBody() {
    if (state.runtimeType == DefaultState) {
      return getDefaultState();
    }
    if (state.runtimeType == ErrorState) {
      return getErrorState();
    }
    if (state.runtimeType == LoadingState) {
      return CircularProgressIndicator();
    }
    if (state.runtimeType == LoadedState) {
      final data = (state as LoadedState).age;
      Map valueMap = jsonDecode(data);
      final int value = valueMap['age'];
      final String valueStr = value.toString();
      return Text(valueStr.toString(),
        style: TextStyle(
          color: Colors.lightBlue,
          fontSize: 25,
        ),
      );
    }
    return Placeholder();
  }

  Widget getDefaultState() {
    return Material(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                hintText: 'Введите имя',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getErrorState() {
    return Material(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  hintText: 'Введите имя',
                  errorText: 'Поле не может быть пустым!',
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getResponse() async {
    if(_controller.text.length == 0){setState(() {
      state = ErrorState();
    });
    } else {
      setState(() {
        state = LoadingState();
      });
      final response = await http.get(
          Uri.parse('https://api.agify.io/?name=${_controller.text}'));
      setState(() {
        state = LoadedState(response.body);
      });
    };
  }
}


class MainPageState {}

class DefaultState extends MainPageState {}

class LoadingState extends MainPageState {}

class LoadedState extends MainPageState {
  final String age;

  LoadedState(this.age);
}

class ErrorState extends MainPageState {}
