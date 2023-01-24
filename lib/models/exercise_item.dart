class ExerciseItem {
  String exItemId;
  String exItemTitle;
  String exItemDescription;
  String exItemProcedure;
  List<String> exItemFocusAreas;
  List<String> exItemDisorderList;

  ExerciseItem({
    required this.exItemId,
    required this.exItemTitle,
    required this.exItemDescription,
    required this.exItemProcedure,
    required this.exItemFocusAreas,
    required this.exItemDisorderList,
  });
}
