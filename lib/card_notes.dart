import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CardNotes extends StatelessWidget {
  final QueryDocumentSnapshot doc;
  final Function()? onTap;

  const CardNotes(
      {super.key,
        required this.doc,
      required this.onTap});



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
                color: Colors.amberAccent,
                borderRadius: BorderRadius.circular(30)),
            height: 120,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),
                        height: 70,
                        width: 70,
                        child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Image.asset(
                              './assets/images/thinking_face.png',
                              scale: 0.5,
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            doc['creation_date'],
                            style: const TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.white,
                                fontSize: 15),
                          ),
                          Text(
                            doc['note_title'],
                            style: const TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.white,
                                fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 180),
                      child: Expanded(
                        flex: 2,
                        child: Icon(Icons.favorite_border),
                      ),
                    ),
                  ],
                ),
              ],
            ),
        ),
      ],
    );
  }
}
