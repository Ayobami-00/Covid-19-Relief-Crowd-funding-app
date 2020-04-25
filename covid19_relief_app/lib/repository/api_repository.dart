import 'package:covid19_relief_app/api/api_client.dart';
import 'package:covid19_relief_app/models/project_model.dart';
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

  Future<String> updateUserById(String token, Map body) {
    return apiClient.updateUserById(token, body);
  }

  Future<String> createProject(String token, Map body){
    return apiClient.createProject(token, body);
  }

  Future<ProjectModel> getAllProjects(String token) {
    return apiClient.getAllProjects(token);
  }

  Future<ProjectModel> getRecommededProjects(String token) {
    return apiClient.getRecommededProjects(token);
  }

  Future<ProjectModel> getProjectById(String token, Map body){
    return apiClient.getProjectById(token, body);
  }

  Future<ProjectModel> updateProjectById(String token, Map body) {
    return apiClient.updateProjectById(token, body);
  }


}