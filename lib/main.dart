import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  String _selectedOption = "";
  List<String> questions = [
    'This too Shall..',
    'Veni,Vidi',
    'I think,therfore I'
  ];
  List<String> options = [
    "Stay,Pass,Leave,Sizzle",
    "Vinivi,Viki,Vici,Vicardio",
    "am,will be,was,am not"
  ];
  List<String> answers = ["Pass", "Vici", "am"];
  int score=0;
  int index=0;
  bool isFinished = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text("Complete the Quote"),
        backgroundColor: Colors.blueGrey,
      ),
      body:isFinished?Text(score.toString()) : questionCard(),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
          onPressed: () {
            if(index<questions.length-1) {
              if (_selectedOption == answers[index]) {
                score++;
              }
              setState(() {
                index++;
                _selectedOption="";
              });
            } else {
                  isFinished = true;
            }
          },
          child: Icon(Icons.navigate_next)),
    ),
    );
  }

  questionCard() {
    List<String>opts= options[index].split(',');

    return Column(children: [
      Text(questions[index],style: Theme.of(context).textTheme.headline4,),
      ListView.builder(shrinkWrap: true,itemBuilder:(context,int i) {
        return ListTile(
          leading: Radio<String>(
            activeColor: Colors.grey,
            value: opts[i],
            groupValue: _selectedOption,
            onChanged: (v) {
              setState(() {
                _selectedOption = v!;
              });
            },
          ),
          title: Text(opts[i]),
        );
      },
      itemCount: opts.length,
      ),
     Text(score.toString()),
    ],
    );
  }
}
