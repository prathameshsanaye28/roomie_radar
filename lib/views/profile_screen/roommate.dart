class Roommate {
  String name;
  String gender;
  String age;
  String image;

  Roommate(this.name, this.gender, this.age, this.image);

  // Convert a Pet object into a Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'gender': gender,
      'age': age,
      'image': image,
    };
  }

  // Create a Pet object from a Map
  static Roommate fromMap(Map<String, dynamic> map) {
    return Roommate(
      map['name'],
      map['gender'],
      map['age'],
      map['image'],
    );
  }
}



