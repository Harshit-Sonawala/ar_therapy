class ExerciseItem {
  String exItemId;
  String exItemTitle;
  String exItemDescription;
  List<String> exItemProcedure;
  List<String> exItemFocusAreas;
  List<String> exItemDisorderList;
  String exItemModelPath;

  ExerciseItem({
    required this.exItemId,
    required this.exItemTitle,
    required this.exItemDescription,
    required this.exItemProcedure,
    required this.exItemFocusAreas,
    required this.exItemDisorderList,
    required this.exItemModelPath,
  });
}
