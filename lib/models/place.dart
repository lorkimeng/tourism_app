class Place {
  final String id;
  final String nameKh;
  final String nameEn;
  final String province;
  final String category;
  final String imageUrl;
  final double rating;
  final String description;
  final List<String> highlights;

  const Place({
    required this.id,
    required this.nameKh,
    required this.nameEn,
    required this.province,
    required this.category,
    required this.imageUrl,
    required this.rating,
    required this.description,
    required this.highlights,
  });
}
