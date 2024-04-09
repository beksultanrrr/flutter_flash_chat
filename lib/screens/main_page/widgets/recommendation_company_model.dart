class RecommendationCompanyModel {
  final String title;
  final double totalAmount;
  final double collectedAmount;
  final String image;
  final List<String>? subtitle;
  final String description;
  final List<String> galleryImages;

  RecommendationCompanyModel({required this.title, required this.totalAmount, required this.collectedAmount, required this.image, this.subtitle, required this.description,required this.galleryImages, });
}
