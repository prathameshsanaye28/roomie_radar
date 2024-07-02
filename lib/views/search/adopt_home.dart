import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roomie_radar/views/property_details/property_details.dart';
import 'package:roomie_radar/views/property_details/property_model.dart';
import 'package:roomie_radar/views/search/filter_screen.dart';

//import '../yourListings_screen/property.dart';

class AdoptPage extends StatefulWidget {
  @override
  _AdoptPageState createState() => _AdoptPageState();
}

class _AdoptPageState extends State<AdoptPage> {
  String selectedBedroom = 'All';
  String selectedOccupancy = 'All';
  String selectedMealType = 'All';
  String selectedAC = 'All';
  double selectedBudgetMin = 0.0;
  double selectedBudgetMax = 10000.0;
  int selectedPGSharing = 0;

  //String selectedBudgetmin = 'All';
  //String selectedBudgetmax = 'All';
  //double selectedPGSharing = 0;
  /*late String selectedBedroom;
  late String selectedOccupancy;
  late String selectedMealType;
  late String selectedAC;
  late String selectedBudgetmin;
  late String selectedBudgetmax;*/


  List<Property> properties = [
    Property(
      title: 'Dummy Property 1',
      description: 'xxxxxxxxxxxxxxxxxx',
      imageUrl: 'assets/images/house2.png',
      price: 2500.0,
      occupancy: 'Any',
      bedrooms: '3',
      mealType: 'Any',
      bathroom: 2,
      airconditioning: 'AC present',
      area: 100,
      location: 'Andheri West',
      image: 'assets/images/house2.png',
      noofpg: 4,
      nopgreqd: '2',
    ),
    Property(
      title: 'Dummy Property 2',
      description: 'xxxxxxxxxxxxxxxxxx',
      imageUrl: 'assets/images/house2.png',
      price: 3500.0,
      occupancy: 'Male',
      bedrooms: '2',
      mealType: 'Veg',
      bathroom: 1,
      airconditioning: 'Non AC',
      area: 200,
      location: 'Azad Nagar',
      image: 'assets/images/house2.png',
      noofpg: 4,
      nopgreqd: '1',
    ),
    Property(
      title: 'Dummy Property 3',
      description: 'xxxxxxxxxxxxxxxxxx',
      imageUrl: 'assets/images/house2.png',
      price: 6500.0,
      occupancy: 'Female',
      bedrooms: '2',
      mealType: 'Veg',
      bathroom: 2,
      airconditioning: 'AC present',
      area: 400,
      location: 'Vile Parle East',
      image: 'assets/images/house2.png',
      noofpg: 3,
      nopgreqd: '1',
    ),
    Property(
      title: 'Dummy Property 4',
      description: 'xxxxxxxxxxxxxxxxxx',
      imageUrl: 'assets/images/house2.png',
      price: 4500.0,
      occupancy: 'Male',
      bedrooms: '3',
      mealType: 'Veg',
      bathroom: 3,
      airconditioning: 'Non AC',
      area: 500,
      location: 'D N Nagar',
      image: 'assets/images/house2.png',
      noofpg: 4,
      nopgreqd: '2',
    ),
    Property(
      title: 'Dummy Property 5',
      description: 'xxxxxxxxxxxxxxxxxx',
      imageUrl: 'assets/images/house2.png',
      price: 5000.0,
      occupancy: 'Female',
      bedrooms: '3',
      mealType: 'Any',
      bathroom: 2,
      airconditioning: 'AC present',
      area: 450,
      location: 'Andheri East',
      image: 'assets/images/house2.png',
      noofpg: 3,
      nopgreqd: '1',
    ),
    Property(
      title: 'Dummy Property 6',
      description: 'xxxxxxxxxxxxxxxxxx',
      imageUrl: 'assets/images/house2.png',
      price: 6000.0,
      occupancy: 'Any',
      bedrooms: '3',
      mealType: 'Any',
      bathroom: 2,
      airconditioning: 'AC present',
      area: 650,
      location: 'Azad Nagar',
      image: 'assets/images/house2.png',
      noofpg: 2,
      nopgreqd: '1',
    ),
    // Add
    // more properties as needed
  ];

  /*@override
  void initState() {
    super.initState();
    // Initialize filter values
    selectedBedroom = 'All';
    selectedOccupancy = 'All';
    selectedMealType = 'All';
    selectedAC = 'All';
    selectedBudgetmin = 'All';
    selectedBudgetmax = 'All';
  }*/

  void applyFilters(Map<String, String?> filters) {
    setState(() {
      selectedBedroom = filters['bedroom'] ?? 'All';
      selectedOccupancy = filters['occupancy'] ?? 'All';
      selectedMealType = filters['mealType'] ?? 'All';
      selectedAC = filters['airConditioning'] ?? 'All';
      selectedBudgetMin = double.tryParse(filters['budgetMin'] ?? '0.0') ?? 0.0;
      selectedBudgetMax = double.tryParse(filters['budgetMax'] ?? '10000.0') ?? 10000.0;
      selectedPGSharing = int.tryParse(filters['pgSharing'] ?? '0') ?? 0;
      //selectedBudgetmin = filters['budgetMin'] ?? 'All';
      //selectedBudgetmax = filters['budgetMax'] ?? 'All';
      //selectedPGSharing = filters['pgSharing'] ?? 0;
    });
  }

  /*void openFilterScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FilterScreen(applyFilters: applyFilters),
      ),
    );
  }*/


  List<Property> filteredHouse() {
    return properties.where((house) {
      if (selectedBedroom != 'All' && house.bedrooms != selectedBedroom) {
        return false;
      }
      if (selectedOccupancy != 'All' && house.occupancy != selectedOccupancy) {
        return false;
      }
      if (selectedAC != 'All' && house.airconditioning != selectedAC) {
        return false;
      }
      if (selectedMealType != 'All' && house.mealType != selectedMealType) {
        return false;
      }
      if (selectedPGSharing != 0 && house.noofpg != selectedPGSharing) { // Add this line
        return false;
      }
      if (house.price < selectedBudgetMin || house.price > selectedBudgetMax) { // Add this line
        return false;}
      //if (selectedPGSharing != 0 && house.noofpg != selectedPGSharing) { // Update condition
      //  return false;
      //}
      return true;
    }).toList();
    return sortProperties(filteredHouse(), 'price');
  }

  List<Property> sortProperties(List<Property> properties, String sortBy) {
    switch (sortBy) {
      case 'price':
        return properties..sort((a, b) => a.price.compareTo(b.price));
      case 'sharing':
        return properties..sort((a, b) => a.noofpg.compareTo(b.noofpg));
      case 'area':
        return properties..sort((a, b) => a.area.compareTo(b.area));
      default:
        return properties;
    }
  }

  /* void applyFilters(Map<String, String?> filters) {
    setState(() {
      selectedBedroom = filters['bedroom'] ?? 'All';
      selectedOccupancy = filters['occupancy'] ?? 'All';
      selectedMealType = filters['mealType'] ?? 'All';
      selectedAC = filters['airconditioning'] ?? 'All';
    });
  }

  void openFilterScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FilterScreen(applyFilters: applyFilters),
      ),
    );
  }*/


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a PG'),
        //centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(217, 217, 236, 255),
                  Color.fromARGB(215, 216, 229, 255),
                  Color(0xD5D5E9FF),
                  Color(0xB9B9D9FF),
                  Color.fromARGB(149, 214, 238, 252),
                  Color.fromARGB(217, 217, 229, 255),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            padding: EdgeInsets.all(10),

            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FilterScreen(applyFilters: applyFilters,
                          selectedFilters: {
                            'bedroom': selectedBedroom,
                            'occupancy': selectedOccupancy,
                            'mealType': selectedMealType,
                            'airConditioning': selectedAC,
                            'budgetMin': selectedBudgetMin.toString(),
                            'budgetMax': selectedBudgetMax.toString(),
                            //'pgSharing': selectedPGSharing,
                          },),
                      ),
                    );
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(112, 163, 184, 0.15),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        const Icon(Icons.sort),
                        const SizedBox(width: 8.0),
                        Text('Apply your filters',),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24,),

                /* Row(
                  children: [

                    Expanded(
                      child: DropdownButtonFormField(
                        value: selectedBedroom,
                        items: [
                          DropdownMenuItem(
                            child: Text('Bedroom'),
                            value: 'All',
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
                            selectedBedroom = value.toString();
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'Bedroom',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: DropdownButtonFormField(
                        value: selectedOccupancy,
                        items: [
                          DropdownMenuItem(
                            child: Text('Occupancy'),
                            value: 'All',
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
                            selectedOccupancy = value.toString();
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'Occupancy',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),*/
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(217, 217, 236, 255),
                    Color.fromARGB(215, 216, 229, 255),
                    Color(0xD5D5E9FF),
                    Color(0xB9B9D9FF),
                    Color.fromARGB(149, 214, 238, 252),
                    Color.fromARGB(217, 217, 229, 255),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: filteredHouse().length,
                itemBuilder: (context, index) {
                  final houses = filteredHouse()[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PropertyDetailView(property: properties[index]),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(houses.image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  houses.title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  '${houses.location} - ${houses.area} sqm',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
