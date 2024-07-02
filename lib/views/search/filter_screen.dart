/*import 'package:flutter/material.dart';

//typedef ApplyFilters = void Function(Map<String, String?>);

class FilterScreen extends StatefulWidget {
  final void Function(Map<String, String>) applyFilters;
  final Map<String, String> selectedFilters;

  const FilterScreen({
    required this.applyFilters,
    required this.selectedFilters,
  });

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
   late Map<String, String> filters;

  @override
  void initState() {
    super.initState();
    filters = widget.selectedFilters;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                selectedBedroom = null;
                selectedOccupancy = null;
                selectedMealType = null;
                selectedAC = null;
              });
              widget.applyFilters({
                'bedroom': null,
                'occupancy': null,
                'mealType': null,
                'airconditioning': null,
              });
              Navigator.pop(context);
            },
            icon: Icon(Icons.clear),
          ),
          IconButton(
            onPressed: () {
              widget.applyFilters({
                'bedroom': selectedBedroom,
                'occupancy': selectedOccupancy,
                'mealType': selectedMealType,
                'airconditioning': selectedAC,
              });
              Navigator.pop(context);
            },
            icon: Icon(Icons.check),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField(
              value: selectedBedroom,
              items: [
                DropdownMenuItem(
                  child: Text('Bedroom'),
                  value: null,
                ),
                DropdownMenuItem(
                  child: Text('2'),
                  value: '2',
                ),
                DropdownMenuItem(
                  child: Text('3'),
                  value: '3',
                ),
              ],
              onChanged: (value) {
                setState(() {
                  selectedBedroom = value as String?;
                });
              },
              decoration: InputDecoration(
                labelText: 'Bedroom',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField(
              value: selectedOccupancy,
              items: [
                DropdownMenuItem(
                  child: Text('Occupancy'),
                  value: null,
                ),
                DropdownMenuItem(
                  child: Text('Male'),
                  value: 'Male',
                ),
                DropdownMenuItem(
                  child: Text('Female'),
                  value: 'Female',
                ),
              ],
              onChanged: (value) {
                setState(() {
                  selectedOccupancy = value as String?;
                });
              },
              decoration: InputDecoration(
                labelText: 'Occupancy',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField(
              value: selectedMealType,
              items: [
                DropdownMenuItem(
                  child: Text('Meal Type'),
                  value: null,
                ),
                DropdownMenuItem(
                  child: Text('Veg'),
                  value: 'Veg',
                ),
                DropdownMenuItem(
                  child: Text('Non-Veg'),
                  value: 'Non-Veg',
                ),
              ],
              onChanged: (value) {
                setState(() {
                  selectedMealType = value as String?;
                });
              },
              decoration: InputDecoration(
                labelText: 'Meal Type',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField(
              value: selectedAC,
              items: [
                DropdownMenuItem(
                  child: Text('Air Conditioning'),
                  value: null,
                ),
                DropdownMenuItem(
                  child: Text('AC present'),
                  value: 'AC present',
                ),
                DropdownMenuItem(
                  child: Text('Non AC'),
                  value: 'Non AC',
                ),
              ],
              onChanged: (value) {
                setState(() {
                  selectedAC = value as String?;
                });
              },
              decoration: InputDecoration(
                labelText: 'Air Conditioning',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/

import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  final void Function(Map<String, String>) applyFilters;
  final Map<String, String> selectedFilters;

  const FilterScreen({
    required this.applyFilters,
    required this.selectedFilters,
  });

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  late Map<String, String> filters;

  @override
  void initState() {
    super.initState();
    //filters = widget.selectedFilters;
    filters = {
      'bedroom': widget.selectedFilters['bedroom'] ?? 'All',
      'occupancy': widget.selectedFilters['occupancy'] ?? 'All',
      'airConditioning': widget.selectedFilters['airConditioning'] ?? 'All',
      'mealType': widget.selectedFilters['mealType'] ?? 'All',
      'budgetMin': (widget.selectedFilters['budgetMin'] ?? '0.0').toString(),
      'budgetMax': (widget.selectedFilters['budgetMax'] ?? '10000.0').toString(),
      'pgSharing': (widget.selectedFilters['pgSharing'] ?? '0').toString(),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Bedroom'),
            subtitle: DropdownButtonFormField(
              value: filters['bedroom'],
              items: [
                DropdownMenuItem(child: Text('All'), value: 'All'),
                DropdownMenuItem(child: Text('2'), value: '2'),
                DropdownMenuItem(child: Text('3'), value: '3'),
              ],
              onChanged: (value) {
                setState(() {
                  filters['bedroom'] = value.toString();
                });
              },
            ),
          ),
          // Add other filter options similarly
          // Example:
          ListTile(
            title: Text('Occupancy'),
            subtitle: DropdownButtonFormField(
              value: filters['occupancy'],
              items: [
                DropdownMenuItem(child: Text('All'), value: 'All'),
                DropdownMenuItem(child: Text('Male'), value: 'Male'),
                DropdownMenuItem(child: Text('Female'), value: 'Female'),
              ],
              onChanged: (value) {
                setState(() {
                  filters['occupancy'] = value.toString();
                });
              },
            ),
          ),
          ListTile(
            title: Text('Air Conditioning'),
            subtitle: DropdownButtonFormField(
              value: filters['airConditioning'],
              items: [
                DropdownMenuItem(child: Text('All'), value: 'All'),
                DropdownMenuItem(child: Text('AC present'), value: 'AC present'),
                DropdownMenuItem(child: Text('Non AC'), value: 'Non AC'),
              ],
              onChanged: (value) {
                setState(() {
                  filters['airConditioning'] = value.toString();
                });
              },
            ),
          ),
          ListTile(
            title: Text('Meal Type'),
            subtitle: DropdownButtonFormField(
              value: filters['mealType'],
              items: [
                DropdownMenuItem(child: Text('All'), value: 'All'),
                DropdownMenuItem(child: Text('Veg'), value: 'Veg'),
                DropdownMenuItem(child: Text('Non Veg'), value: 'Any'),
              ],
              onChanged: (value) {
                setState(() {
                  filters['mealType'] = value.toString();
                });
              },
            ),
          ),
         /* ListTile(
            title: Text('PG sharing'),
            subtitle: DropdownButtonFormField(
              value: filters['noofpg'],
              items: [
                DropdownMenuItem(child: Text('All'), value: 'All'),
                DropdownMenuItem(child: Text('2'), value: '2'),
                DropdownMenuItem(child: Text('3'), value: '3'),
                DropdownMenuItem(child: Text('4'), value: '4'),
                DropdownMenuItem(child: Text('5'), value: '5'),
                DropdownMenuItem(child: Text('6'), value: '6'),
              ],
              onChanged: (value) {
                setState(() {
                  filters['noofpg'] = value.toString();
                });
              },
            ),
          ),*/

          ListTile(
            title: Text('PG sharing'),
            subtitle: DropdownButtonFormField<String>(
              value: filters['pgSharing'],
              items: [
                DropdownMenuItem(child: Text('All'), value: '0'),
                DropdownMenuItem(child: Text('2'), value: '2'),
                DropdownMenuItem(child: Text('3'), value: '3'),
                DropdownMenuItem(child: Text('4'), value: '4'),
                DropdownMenuItem(child: Text('5'), value: '5'),
                DropdownMenuItem(child: Text('6'), value: '6'),
              ],
              onChanged: (String? value) {
                setState(() {
                  filters['pgSharing'] = value!;
                });
              },
            ),
          ),

          ListTile(
            title: Text('Budget Range'),
            subtitle: Row(
              children: [
                Expanded(
                  child: SliderTheme(
                    data: SliderThemeData(
                      activeTrackColor: Colors.blue,
                      inactiveTrackColor: Colors.grey,
                      thumbColor: Colors.blue,
                      valueIndicatorColor: Colors.blue,
                    ),
                    child: RangeSlider(
                      values: RangeValues(
                        double.tryParse(filters['budgetMin'] ?? '0.0') ?? 0.0,
                        double.tryParse(filters['budgetMax'] ?? '10000.0') ?? 10000.0,
                      ),
                      min: 0.0,
                      max: 10000.0,
                      divisions: 100,
                      labels: RangeLabels(
                        '₹${double.tryParse(filters['budgetMin'] ?? '0.0') ?? 0.0}',
                        '₹${double.tryParse(filters['budgetMax'] ?? '10000.0') ?? 10000.0}',
                      ),
                      onChanged: (RangeValues values) {
                        setState(() {
                          filters['budgetMin'] = values.start.toString();
                          filters['budgetMax'] = values.end.toString();
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),


          ListTile(
            title: Text('Apply Filters'),
            trailing: ElevatedButton(
              onPressed: () {
                widget.applyFilters(filters);
                Navigator.pop(context);
              },
              child: Text('Apply'),
            ),
          ),
          ListTile(
            title: Text('Clear Filters'),
            trailing: ElevatedButton(
              onPressed: () {
                setState(() {
                  filters = {
                    'bedroom': 'All',
                    'occupancy': 'All',
                    'airconditioning': 'All',
                    'mealtype': 'All',
                    // Add other filter keys with default values
                  };
                });
              },
              child: Text('Clear'),
            ),
          ),
        ],
      ),
    );
  }
}

