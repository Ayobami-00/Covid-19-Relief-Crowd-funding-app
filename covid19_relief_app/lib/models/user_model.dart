class UserModel {
  String _email;
  String _password;
  String _full_name;
  int _total_amount;
  int _projects_supported;

  UserModel.fromJson(Map<String, dynamic> parsedJson) {
    _email = parsedJson['email'];
    _password = parsedJson['password'];
    _full_name = parsedJson['user_accounts']['full_name'];
    _total_amount = parsedJson['user_accounts']['total_amount'];
    _projects_supported = parsedJson['user_accounts']['projects_supported'];
  }

  Map<String, dynamic> toJson() => {
        "email": _email,
        "password": _password,
        "user_accounts": {
          "full_name": _full_name,
          "total_amount": _total_amount,
          "projects_supported": _projects_supported
        }
      };

  String get email => _email;

  String get password => _password;

  String get full_name => _full_name;

  int get total_amount => _total_amount;

  int get projects_supported => _projects_supported;
}

class UserLoginModel {
  String _email;
  String _password;

  UserLoginModel.fromJson(Map<String, dynamic> parsedJson) {
    _email = parsedJson['email'];
    _password = parsedJson['password'];
  }

  Map<String, dynamic> toJson() => {
        "email": _email,
        "password": _password,
      };

  String get email => _email;

  String get password => _password;
}
