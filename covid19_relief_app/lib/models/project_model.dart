class ProjectModel {
  String _id;
  String _organization_name;
  String _organization_id;
  String _project_description;
  String _project_location_state;
  String _project_location_country;
  String _start_date;
  String _end_date;
  double _goal;
  double _pledged;
  int _investors;
  String _project_status;
  String _product_image_url;
  String _product_video_url;


  ProjectModel.fromJson(Map<String, dynamic> parsedJson) {
    _id = parsedJson['id'];
    _organization_name = parsedJson['organization_name'];
   _organization_id = parsedJson['organization_id'];
    _project_description = parsedJson['project_descripton'];
    _project_location_state = parsedJson['project_location_state'];
    _project_location_country = parsedJson['project_location_country'];
    _start_date = parsedJson['start_date'];
    _end_date = parsedJson['end_date'];
    _goal = parsedJson['goal'];
    _pledged = parsedJson['pledged'];
    _investors = parsedJson['investors'];
    _project_status = parsedJson['project_status'];
     _product_image_url = parsedJson['product_image_url'];
     _product_video_url = parsedJson['product_video_url'];

  }

  Map<String, dynamic> toJson() => {
        "organization_name" : _organization_name,
    "organization_id" : _organization_id,
    "project_description" : _project_description,
    "project_location_state" : _project_location_state,
    "project_location_country" : _project_location_country,
    "start_date" : _start_date,
    "end_date" : _end_date,
    "goal" : _goal,
    "pledged" : _pledged,
    "investors" : _investors,
    "project_status" : _project_status,
    "product_image_url" : _product_image_url,
    "Product_video_url" : _product_video_url,

      };

  String get id => _id;

  String get organization_name => _organization_name;

  String get  organization_id => _organization_id;

  String get project_description => _project_description;

  String get project_location_state => _project_location_state;

  String get project_location_country => _project_location_country;

  String get start_date => _start_date;

  String get end_date => _end_date;

  double get goal => _goal;

  double get pledged => _pledged;

  int get investors => _investors;

  String get project_status => _project_status;

  String get product_image_url => _product_image_url;

  String get product_video_url => _product_video_url;


}
