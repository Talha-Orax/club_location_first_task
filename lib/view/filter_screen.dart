import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  // State variables for filters
  List<String> sportOptions = ['Padel', 'Tennis', 'Pickleball', 'Squash'];
  List<String> selectedSports = ['Padel']; // Default selected sport

  double distanceValue = 10.0; // Default distance in km
  double priceValue = 250.0; // Default price
  String selectedSize = ''; // Selected court size

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header with title and close button
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Empty space with the same width as the icon button
            const SizedBox(width: 48),

            // Centered text
            const Text(
              'Filter by',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            // Close button on the right
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),

        const SizedBox(height: 25),

        // Sport section
        const Text(
          'Sport',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          children: sportOptions.map((sport) {
            bool isSelected = selectedSports.contains(sport);
            return FilterChip(
              side: BorderSide(
                color: isSelected
                    ? Colors.transparent
                    : const Color.fromARGB(255, 228, 178, 30),
                width: 1,
              ),
              label: Text(sport),
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
              ),
              showCheckmark: false,
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    selectedSports.add(sport);
                  } else {
                    selectedSports.remove(sport);
                  }
                });
              },
              selectedColor: const Color.fromARGB(255, 190, 138, 58),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            );
          }).toList(),
        ),

        const SizedBox(height: 20),

        // Distance section
        const Text(
          'Distance',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 10),
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Slider(
              value: distanceValue,
              min: 0,
              max: 50,
              overlayColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 243, 243, 243).withOpacity(0.8)),
              divisions: 10,
              onChanged: (value) {
                setState(() {
                  distanceValue = value;
                });
              },
              secondaryActiveColor: Colors.amber,
              activeColor: const Color.fromARGB(255, 190, 138, 58),
              label: '${distanceValue.toStringAsFixed(0)} km',
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('0km'),
              Text('50km'),
            ],
          ),
        ),

        const SizedBox(height: 20),

        // Price section
        const Text(
          'Price',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 10),
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Slider(
              value: priceValue,
              min: 0,
              max: 500,
              overlayColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 243, 243, 243).withOpacity(0.8)),
              divisions: 10,
              onChanged: (value) {
                setState(() {
                  priceValue = value;
                });
              },
              label: '\$${priceValue.toStringAsFixed(0)}',
              secondaryActiveColor: Colors.amber,
              activeColor: const Color.fromARGB(255, 190, 138, 58),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$0'),
              Text('\$500'),
            ],
          ),
        ),

        const SizedBox(height: 20),

        // Size section
        const Text(
          'Size',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 10),
        Center(
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 20,
            children: ['Single', 'Double'].map((size) {
              bool isSelected = selectedSize == size;
              return ChoiceChip(
                side: BorderSide(
                  color: isSelected
                      ? Colors.transparent
                      : const Color.fromARGB(255, 228, 178, 30),
                  width: 1,
                ),
                label: Text(size),
                labelStyle: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                ),
                selected: isSelected,
                showCheckmark: false,
                onSelected: (selected) {
                  setState(() {
                    selectedSize = selected ? size : '';
                  });
                },
                selectedColor: const Color.fromARGB(255, 190, 138, 58),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              );
            }).toList(),
          ),
        ),

        const Spacer(),

        // Action buttons
        Row(
          children: [
            Expanded(
              flex: 1,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    selectedSports = ['Padel'];
                    distanceValue = 10.0;
                    priceValue = 250.0;
                    selectedSize = '';
                  });
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.grey[200],
                  side: const BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Reset',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                      fontSize: 16),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 2,
              child: ElevatedButton(
                onPressed: () {
                  // Here you would apply the filter and pass back results
                  Navigator.pop(context, {
                    'sports': selectedSports,
                    'distance': distanceValue,
                    'price': priceValue,
                    'size': selectedSize,
                  });
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromARGB(255, 190, 138, 58),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Apply Filter',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
