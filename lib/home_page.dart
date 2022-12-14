import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/card_notes.dart';
import 'package:notes_app/note_editor.dart';
import 'package:notes_app/note_reader.dart';
import 'firebase_options.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'My \nNotes',
                  style: TextStyle(
                      decoration: TextDecoration.none, color: Colors.white),
                ),
              ),
            ],
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('Notes').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasData) {
                  return ListView(
                    // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //     crossAxisCount: 1),
                    children: snapshot.data!.docs
                        .map((note) => CardNotes(doc: note, onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => NoteReader(note)));
                    }))
                        .toList(),
                  );
                }
                return Text('There is no Notes');
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => NoteEditor()));
              },
              style: ElevatedButton.styleFrom(shape: const CircleBorder()),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(50)),
                child: const Icon(Icons.add),
              ),
            ),
          )
        ],
      ),
    );
  }
}
