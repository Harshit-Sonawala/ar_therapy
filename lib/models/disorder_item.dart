class DisorderItem {
  String disItemId;
  String disItemTitle;
  String disItemDescription;
  List<String> disItemCauses;
  List<String> disItemSymptoms;
  List<String> disItemExerciseList;
  List<String> disItemImagePaths;

  DisorderItem({
    required this.disItemId,
    required this.disItemTitle,
    required this.disItemDescription,
    required this.disItemCauses,
    required this.disItemSymptoms,
    required this.disItemExerciseList,
    required this.disItemImagePaths,
  });
}
