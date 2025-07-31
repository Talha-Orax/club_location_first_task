import 'package:flutter/material.dart';
import 'package:club_location_first_task/model/filter_model.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  // State variables for filters
  List<SportType> selectedSports = [SportType.padel]; // Default selected sport

  double distanceValue = 0.0; // Default distance in km
  double priceValue = 0.0; // Default price
  CourtSizeType? selectedSize; // Selected court size

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

        // const SizedBox(height: 25),
        const Spacer(),

        // Sport section
        const Text(
          'Sport',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        const Spacer(),
        Wrap(
          spacing: 8,
          children: SportType.values.map((sport) {
            bool isSelected = selectedSports.contains(sport);
            return FilterChip(
              side: BorderSide(
                color: isSelected
                    ? Colors.transparent
                    : const Color.fromARGB(255, 228, 178, 30),
                width: 1,
              ),
              elevation: 5,
              label: Text(sport.name),
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

        // const SizedBox(height: 20),
        const Spacer(),

        // Distance section
        const Text(
          'Distance',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        // const SizedBox(height: 10),
        const Spacer(),
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Slider(
              value: distanceValue,
              min: 0,
              max: 1000,
              overlayColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 243, 243, 243).withOpacity(0.8)),
              divisions: 1000,
              onChanged: (value) {
                setState(() {
                  distanceValue = value;
                });
              },
              inactiveColor:
                  const Color.fromARGB(255, 179, 160, 54).withOpacity(0.2),
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
              Text('1000km'),
            ],
          ),
        ),

        // const SizedBox(height: 20),
        const Spacer(),

        // Price section
        const Text(
          'Price',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        // const SizedBox(height: 10),
        const Spacer(),
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Slider(
              value: priceValue,
              min: 0,
              max: 800,
              overlayColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 243, 243, 243).withOpacity(0.8)),
              divisions: 500,
              onChanged: (value) {
                setState(() {
                  priceValue = value;
                });
              },
              inactiveColor:
                  const Color.fromARGB(255, 179, 160, 54).withOpacity(0.2),
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
              Text('\$800'),
            ],
          ),
        ),

        // const SizedBox(height: 20),
        const Spacer(),

        // Size section
        const Text(
          'Size',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        // const SizedBox(height: 10),
        const Spacer(),
        Center(
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 20,
            children: CourtSizeType.values.map((size) {
              bool isSelected = selectedSize == size;
              return ChoiceChip(
                elevation: 5,
                side: BorderSide(
                  color: isSelected
                      ? Colors.transparent
                      : const Color.fromARGB(255, 228, 178, 30),
                  width: 1,
                ),
                label: Text(size.name),
                labelStyle: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                ),
                selected: isSelected,
                showCheckmark: false,
                onSelected: (selected) {
                  setState(() {
                    selectedSize = selected ? size : null;
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

        const SizedBox(
          height: 25,
        ),

        // Action buttons
        Row(
          children: [
            Expanded(
              flex: 1,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    selectedSports = [SportType.padel];
                    distanceValue = 10.0;
                    priceValue = 250.0;
                    selectedSize = null; // Reset selected size
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
                  FilterModel filter = FilterModel(
                    sport:
                        selectedSports.isNotEmpty ? selectedSports.first : null,
                    size: selectedSize,
                    price: priceValue.toStringAsFixed(0),
                    distance: distanceValue.toStringAsFixed(0),
                  );
                  Navigator.pop(context, filter);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromARGB(255, 190, 138, 58),
                  elevation: 5,
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
