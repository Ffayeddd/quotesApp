import 'package:flutter/material.dart';
import 'package:taskaya/main.dart';

class Cardaya extends StatelessWidget {

  final String mytitle;
  final String person;
  final Function delete;
  final  Quotes iiii;
  const Cardaya({required this.mytitle, required this.person ,required this.delete, required this.iiii});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor:Colors.amber ,
      elevation: 1,
      color: Colors.blue,
      margin: const EdgeInsets.all(11),
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Container(
        padding: const EdgeInsets.all(11),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             Text(
              mytitle,
              textDirection: TextDirection.rtl,
              style: const TextStyle(fontSize: 27, color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: (){
                    delete(iiii);
                  },
                  icon: const Icon(Icons.delete),
                  iconSize: 27,
                  color:const Color.fromARGB(255, 255, 217, 217),
                ),
                 Text(
                 person,
                  style: const TextStyle(fontSize: 17, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
