class CarModel {
  final String model;
  final double price;
  final String description;
  final String date;
  final double rating;
  final String carImage;
  

  CarModel(
      {
        required this.carImage,
        required this.model,
      required this.price,
      required this.description,
      required this.date,
      required this.rating});
}
