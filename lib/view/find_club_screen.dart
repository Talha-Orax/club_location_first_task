import 'package:flutter/material.dart';

class FindClubScreen extends StatelessWidget {
  const FindClubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(20, kToolbarHeight - 10, 0, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Find a Club",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined),
                    Text("Newtwon, USA"),
                  ],
                )
              ],
            ),
            SizedBox(
              width: 10,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(Icons.search),
              ),
            ),
            IconButton.outlined(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            IconButton.outlined(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ],
        ),
      ),
    );
  }
}
