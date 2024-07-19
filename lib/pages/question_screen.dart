import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:convert/convert.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var unescape = HtmlUnescape();
  String question = '';

  api_call() async {
    String API_ENDPOINT = "https://opentdb.com/api.php?amount=10&type=multiple";

    final response = await http.get(Uri.parse(API_ENDPOINT));
    if (response.statusCode == 200) {
      print("Success");
      var DecodedData = jsonDecode(response.body);

      for (int i = 0; i < 10; i++) {
        List options = [];
        print(i);
        setState(() {
          question =
              HtmlUnescape().convert(DecodedData['results'][i]["question"]);
          print(question);
        });
        String correct_answer =
            HtmlUnescape().convert(DecodedData['results'][i]["correct_answer"]);
        print("Correct:$correct_answer");

        for (int j = 0; j < 3; j++) {
          options.add(HtmlUnescape()
              .convert(DecodedData['results'][i]["incorrect_answers"][j]));
        }
        options.add(correct_answer);
        print(options..shuffle());
      }

    }
  }

  @override
  void initState() {
    super.initState();
    api_call();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: SizedBox(
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: MediaQuery.sizeOf(context).height * 0.25,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(35)),
                      ),
                      Positioned(
                        left: MediaQuery.of(context).size.width / 2 -
                            70, // Centered horizontally
                        top: MediaQuery.of(context).size.height * 0.35 / 2 -
                            50, // Centered vertically
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(child: Text("TIME")),
                        ),
                      ),
                      Positioned(
                        //left: MediaQuery.of(context).size.width / 2 -80, // Centered horizontally
                        top: MediaQuery.of(context).size.height * 0.2,
                        left: MediaQuery.of(context).size.height *
                            0.01, // Centered vertically
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.25,
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Text(question,
                                style: TextStyle(
                                  fontSize: 24,
                                ),
                                textAlign: TextAlign.center),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width*0.75,
                  height: MediaQuery.sizeOf(context).height*0.08,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.blue)
                  ),
                  child: Row(
                    children: [
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width*0.75,
                  height: MediaQuery.sizeOf(context).height*0.08,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blue)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width*0.75,
                  height: MediaQuery.sizeOf(context).height*0.08,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blue)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width*0.75,
                  height: MediaQuery.sizeOf(context).height*0.08,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blue)
                  ),
                ),
              ),
              SizedBox(height: 50,)
            ],
          ),
        ),
      ),
    );
  }
}
