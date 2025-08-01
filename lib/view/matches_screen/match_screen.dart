import 'package:flutter/material.dart';

class FindMatches extends StatefulWidget {
  const FindMatches({super.key});

  @override
  State<FindMatches> createState() => FindMatchesState();
}

class FindMatchesState extends State<FindMatches> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: kToolbarHeight + 20,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Find Matches',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.network(
              'https://img.icons8.com/external-flat-circle-design-circle/66/external-Profile-Avatar-web-and-networking-flat-circle-design-circle.png',
              width: 50,
              height: 50,
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                OutlinedButton(
                    onPressed: () async {
                      final location = await showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) {
                            return SizedBox(
                              height: 200,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Spacer(),
                                      const Text(
                                        textAlign: TextAlign.center,
                                        'Location',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Spacer(),
                                      IconButton(
                                        icon: const Icon(Icons.close),
                                        onPressed: () =>
                                            Navigator.pop(context, null),
                                      ),
                                    ],
                                  ),
                                  ListTile(
                                    title: const Text('City'),
                                    onTap: () => Navigator.pop(context, 'City'),
                                  ),
                                  ListTile(
                                    title: const Text('Country'),
                                    onTap: () =>
                                        Navigator.pop(context, 'Country'),
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                    style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 8),
                        side: const BorderSide(
                            color: Color.fromARGB(255, 221, 134, 52),
                            width: 1.0),
                        foregroundColor:
                            const Color.fromARGB(255, 221, 134, 52),
                        backgroundColor: Colors.white),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.location_on_rounded,
                          size: 20,
                        ),
                        SizedBox(width: 2),
                        Text(
                          'City',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                      ],
                    )),
                const Spacer(),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 8),
                        side: const BorderSide(
                            color: Color.fromARGB(255, 221, 134, 52),
                            width: 1.0),
                        foregroundColor:
                            const Color.fromARGB(255, 221, 134, 52),
                        backgroundColor: Colors.white),
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Icon(
                          Icons.calendar_month_outlined,
                          size: 20,
                        ),
                        SizedBox(width: 2),
                        Text(
                          '${1} - ${2} ${"aug"}',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                      ],
                    )),
                const Spacer(),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 8),
                        side: const BorderSide(
                            color: Color.fromARGB(255, 221, 134, 52),
                            width: 1.0),
                        foregroundColor:
                            const Color.fromARGB(255, 221, 134, 52),
                        backgroundColor: Colors.white),
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Icon(
                          Icons.unfold_less_rounded,
                          size: 20,
                        ),
                        SizedBox(width: 2),
                        Text(
                          '${0.0} - ${6.0}',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                      ],
                    )),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 10),
            // display matches
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Replace with actual match count
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white,
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    child: ListTile(
                      title: Text('Match ${index + 1}'),
                      subtitle: Text('Details about match ${index + 1}'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
