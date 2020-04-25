class UserModel {
  String _email;
  String _password;
  String _full_name;
  double _total_amount;
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

  double get total_amount => _total_amount;

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

class UserProfileModel {
  String _id;
  String _full_name;
  double _total_amount;
  int _projects_supported;
  String _user_image_url;

  UserProfileModel.fromJson(Map<String, dynamic> parsedJson) {
    _id = parsedJson['id'];
    _full_name = parsedJson['full_name'];
    _total_amount = parsedJson['total_amount'];
    _projects_supported = parsedJson['projects_supported'];
    _user_image_url = parsedJson['user_image_url'];
  }

  Map<String, dynamic> toJson() => {
        "id": _id,
        "full_name": _full_name,
        "projects_supported": _projects_supported,
        "total_amount": _total_amount,
        "user_image_url" : _user_image_url
      };

  String get id => _id;

  String get full_name => _full_name;

  double get total_amount => _total_amount;

  int get projects_supported => _projects_supported;

  String get user_image_url => _user_image_url;
}
