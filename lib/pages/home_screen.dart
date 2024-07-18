import 'package:flutter/material.dart';
import 'package:quizapp/widgets/instruction_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Hello User!!!!",
                  style: TextStyle(
                    color: Colors.blue[700],
                    fontSize: 30,
                  ),
                ),
              ),
              Text("Let's Test Your Knowledge",
                  style: TextStyle(
                    color: Colors.blue[700],
                    fontSize: 30,
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 40, 10, 20),
                child: Center(
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.5,
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(35)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "Instructions",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        InstructionField(main_text:"10 Questions" ,
                            sub_text: "Questions will be of MCQ Type",
                            rad_val: 27.5, field: Image.asset('assets/continue.png'),),
                        InstructionField(main_text:"5 Minutes" ,
                            sub_text: "Limit is 30 seconds per question",
                            rad_val: 27.5,field: Image.asset('assets/midnight.png')),
                        InstructionField(main_text:"For Every Right Answer" ,
                            sub_text: "",
                            rad_val: 0, field: Text(' +4 ',
                              style: TextStyle(fontSize: 35,)),),
                        InstructionField(main_text:"For Every Wrong Answer" ,
                          sub_text: "",
                          rad_val: 0, field: Text(' -1 ',
                              style: TextStyle(fontSize: 35)),),

                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
