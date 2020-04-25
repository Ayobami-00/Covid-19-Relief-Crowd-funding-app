class FundsModel {
  String _id;
  String _user_account_id;
  String _project_id;
  int _funds_pledged;
  String _timestamp;

  FundsModel.fromJson(Map<String, dynamic> parsedJson) {
    _id = parsedJson['id'];
    _user_account_id = parsedJson['user_account_id'];
    _project_id = parsedJson['project_id'];
    _funds_pledged = parsedJson['funds_pledged'];
    _timestamp = parsedJson['timestamp'];
  }

  Map<String, dynamic> toJson() => {
        "id": _id,
        "user_account_id": _user_account_id,
        "project_id": _project_id,
        "funds_pledged": _funds_pledged,
        "timestamp" :_timestamp
      };

  String get id => _id;

  String get user_account_id => _user_account_id;

  String get project_id => _project_id;

  int get funds_pledged => _funds_pledged;

  String get timestamp=> _timestamp;
}
