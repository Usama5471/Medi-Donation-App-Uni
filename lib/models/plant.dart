class Plant {
  final String name; // Urdu name
  final String botanicalName;
  final String romanUrduName;
  final String englishName;
  final String description;
  final List<String> imagePaths; // ✅ changed from String to List<String>

  Plant({
    required this.name,
    required this.botanicalName,
    required this.romanUrduName,
    required this.englishName,
    required this.description,
    required this.imagePaths,
  });
}
