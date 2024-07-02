class Property {
  String label;
  String name;
  double price;
  String location;
  int sqm;
  double review;
  String description;
  String frontImage;
  String ownerImage;
  List<String> images;
  int rooms;
  int bathrooms;

  Property(
    this.label,
    this.name,
    this.price,
    this.location,
    this.sqm,
    this.review,
    this.description,
    this.frontImage,
    this.ownerImage,
    this.images,
    this.rooms,
    this.bathrooms,
  );
}
