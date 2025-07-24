import 'package:flutter/material.dart';

class CardListWidget extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  const CardListWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        final item = data[index];
        final List<IconData> icons = List<IconData>.from(item['icons']);
        final bool membership = item['check'];
        final double distance = item['distance'];
        final String logo = item['logo'];

        return Card(
          elevation: 2,
          color: Colors.white,
          margin: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(6),
                  height: 100,
                  width: 90,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/images/image.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${item['title']} - ${item['subtitle']}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 2),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: icons.map((icon) {
                            return Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child:
                                  Icon(icon, size: 20, color: Colors.black87),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 2),
                        if (membership)
                          Card(
                            color: Colors.white,
                            elevation: 3,
                            shape: BeveledRectangleBorder(
                                borderRadius: BorderRadius.circular(2)),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 2),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.art_track_rounded,
                                    color: Color.fromARGB(255, 218, 172, 22),
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    "Membership Required",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(logo),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text("$distance"),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
