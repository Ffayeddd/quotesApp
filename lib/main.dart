import 'package:flutter/material.dart';
import 'package:taskaya/card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: taskaya(),
    );
  }
}

class taskaya extends StatefulWidget {
  const taskaya({super.key});

  @override
  State<taskaya> createState() => _taskayaState();
}

class Quotes {
  String title;
  String author;
  Quotes({required this.title, required this.author});
}

class _taskayaState extends State<taskaya> {
  List AllQuotes = [
    Quotes(title: "الشربربىءها", author: "fatoma elamora"),
    Quotes(title: "المال الحلال اهوو", author: "atef bayen"),
  ];

  delete(Quotes iiii) {
    setState(() {
      AllQuotes.remove(iiii);
    });
  }
  addNewQuote(){
    setState(() {
      AllQuotes.add(
        Quotes (title:myController.text, author:myController2.text),
      );
    });
  }
  //da 34an a save el hktboh fe el text fields
  final myController = TextEditingController();
  final myController2 = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                //h3ml msafa internal mn el gmben
                return Padding(
                  padding: const EdgeInsets.all(22),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       TextField(
                        decoration: InputDecoration(hintText: "add new quote"),
                        maxLength: 20,
                        controller: myController,
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                       TextField(
                        decoration: InputDecoration(hintText: "add author"),
                        maxLength: 20,
                        controller: myController2,
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            addNewQuote();
                          },
                          child: const Text(
                            "ADD",
                            style: TextStyle(fontSize: 22),
                          ))
                    ],
                  ),
                );
              },
              isScrollControlled: true);
        },
        backgroundColor: Colors.redAccent,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 50, 57, 121),
        title: const Text(
          "Quotes",
          style: TextStyle(fontSize: 27),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...AllQuotes.map((item) => Cardaya(
                  mytitle: "item.title",
                  person: "item.author",
                  //keyma el delete = func ell 3ayz a48lha
                  delete: delete,
                  iiii: item,

                  //el item btdol 3la kol element f el list lw7do
                )).toList(),
          ],
        ),
        // elamp de btkrr el cardaya bl3dd bta3 cards elly m7ddah ell howa 2 fo2 gwa ellist
      ),
    );
  }
}
