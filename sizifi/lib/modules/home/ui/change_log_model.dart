class ChangeLog {
  final String userName;
  final String previousItem;
  final String currentItem;
  final String dateTime;

  ChangeLog({
    required this.userName,
    required this.previousItem,
    required this.currentItem,
    required this.dateTime,
  });
}


List<ChangeLog> changeLogs = [];
