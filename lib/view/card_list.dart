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
        final String clubImage = item['image'];
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
                  margin: const EdgeInsets.all(2),
                  height: 100,
                  width: 90,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      clubImage,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.sports_tennis,
                              size: 40,
                              color: Colors.grey,
                            ),
                            Text(
                              "Image failed",
                            )
                          ],
                        ),
                      ),
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(2, 2, 1, 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                item['title'],
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Wrap(
                          spacing: 6,
                          runSpacing: 6,
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
                                  Icon(icon, size: 17, color: Colors.black87),
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
                                  horizontal: 2, vertical: 1),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.art_track_rounded,
                                    size: 20,
                                    color: Color.fromARGB(255, 218, 172, 22),
                                  ),
                                  SizedBox(
                                    width: 1,
                                  ),
                                  Text(
                                    "Membership Required",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10),
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
                    horizontal: 1,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image.network(
                        logo,
                        height: 40,
                        width: 40,
                        // fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Icon(
                            Icons.sports_basketball,
                            size: 30,
                            color: Colors.grey,
                          ),
                        ),
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Container(
                            color: Colors.grey[200],
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Text("$distance km",
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 10)),
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
