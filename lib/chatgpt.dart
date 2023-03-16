import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class chatgpt extends StatefulWidget {
  const chatgpt({super.key});

  @override
  State<chatgpt> createState() => _chatgptState();
}

class _chatgptState extends State<chatgpt> {
  final client = http.Client();
Future<void> fetchDataHttp() async {
final apiUrl = Uri.parse('https://api.chatgpt.com/v1/chat');
final response = await client.post(apiUrl, body: {
  'message': 'what is flutter',
  'token': 'zia2',
});
if (response.statusCode == 200) {
  final responseData = json.decode(response.body);
  // Handle the response from ChatGPT
} else {
  // Handle the error response
}


// print data

final responseData = json.decode(response.body);
final chatResponse = responseData['response'];
print(chatResponse);

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Container(child: ElevatedButton(onPressed: (){
  fetchDataHttp();
},child: Text('show data on console'),),)
    );
  }
}