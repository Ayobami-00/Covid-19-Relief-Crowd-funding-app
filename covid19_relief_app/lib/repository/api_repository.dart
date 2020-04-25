import 'package:covid19_relief_app/api/api_client.dart';
import 'package:covid19_relief_app/models/user_model.dart';
import 'package:meta/meta.dart';

class ApiRepository {
  final ApiClient apiClient;

  ApiRepository({@required this.apiClient}): assert(apiClient != null);
  Future<String> signUpUser({Map body}) async {
    return apiClient.signUpUser(body: body);
  }

  Future<String> signInUser({Map body}) async {
    return apiClient.signInUser(body: body);
  }
  
  Future<UserProfileModel> fetchUserProfile(String token){
    return apiClient.fetchUserProfile(token);
  }
}