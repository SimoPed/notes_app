import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/style/app_style.dart';

class CardNotes extends StatelessWidget {
  final QueryDocumentSnapshot doc;
  final Function()? onTap;

  const CardNotes({super.key, required this.doc, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          decoration: BoxDecoration(
              color: AppStyle.cardsColor[doc['color_id']],
              borderRadius: BorderRadius.circular(30)),
          height: 120,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 150,
                          child: Text(
                            doc['note_title'],
                            style: const TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: SizedBox(
                            width: 150,
                            child: Text(
                              doc['creation_date'],
                              style: const TextStyle(
                                  decoration: TextDecoration.none,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 180,
                          child: Text(
                            doc['note_content'],
                            style: const TextStyle(
                              decoration: TextDecoration.none,
                              color: Colors.black,
                                fontWeight: FontWeight.normal,
                              fontSize: 12,
                              height: 1.5
                            ),
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent),
                          child: const Icon(Icons.favorite_border, color: Colors.black,)))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
