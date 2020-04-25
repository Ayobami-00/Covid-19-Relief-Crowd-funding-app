import 'dart:convert';
import 'dart:io';
import 'package:covid19_relief_app/models/project_model.dart';
import 'package:covid19_relief_app/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  static const baseUrl = 'https://covid19reliefappdjangorestapi.herokuapp.com';

  Future<String> signUpUser({Map body}) async {
    final url = '$baseUrl/api/signup';
    return http.post(url, body: body).then((http.Response response) {
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return json.decode(response.body);
    });
  }

  Future<String> signInUser({Map body}) async {
    final url = '$baseUrl/api/signin';
    return http.post(url, body: body).then((http.Response response) {
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return json.decode(response.body)['token'];
    });
  }

  Future<UserProfileModel> fetchUserProfile(String token) async {
    final url = '$baseUrl/api/account';
    final response = await http.get(
      url,
      headers: {HttpHeaders.authorizationHeader: 'Bearer ' + token},
    );
    final responseJson = json.decode(response.body);

    return UserProfileModel.fromJson(responseJson['data'][0]);
  }

   Future<String> updateUserById(String token, Map body) async {
    final url = '$baseUrl/api/updateuser';
    return http.put(
      url,
      body: body,
      headers: {HttpHeaders.authorizationHeader: 'Bearer ' + token},
    ).then((http.Response response) {
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }

      return json.decode(response.body);
    });
  }

  Future<String> createProject(String token, Map body) async {
    final url = '$baseUrl/api/createproject';
    return http.post(
      url,
      body: body,
      headers: {HttpHeaders.authorizationHeader: 'Bearer ' + token},
    ).then((http.Response response) {
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return json.decode(response.body);
    });
  }

  Future<ProjectModel> getAllProjects(String token) async {
    final url = '$baseUrl/api/projects';
    final response = await http.get(
      url,
      headers: {HttpHeaders.authorizationHeader: 'Bearer ' + token},
    );
    final responseJson = json.decode(response.body);

    return ProjectModel.fromJson(responseJson['data'][0]);
  }

  Future<ProjectModel> getRecommededProjects(String token) async {
    final url = '$baseUrl/api/recommendedprojects';
    final response = await http.get(
      url,
      headers: {HttpHeaders.authorizationHeader: 'Bearer ' + token},
    );
    final responseJson = json.decode(response.body);

    return ProjectModel.fromJson(responseJson['data'][0]);
  }

  Future<ProjectModel> getProjectById(String token, Map body) async {
    final url = '$baseUrl/api/getproject';
    return http.post(
      url,
      body: body,
      headers: {HttpHeaders.authorizationHeader: 'Bearer ' + token},
    ).then((http.Response response) {
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      final responseJson = json.decode(response.body);

      return ProjectModel.fromJson(responseJson['data'][0]);
    });
  }


  Future<ProjectModel> updateProjectById(String token, Map body) async {
    final url = '$baseUrl/api/updateproject';
    return http.post(
      url,
      body: body,
      headers: {HttpHeaders.authorizationHeader: 'Bearer ' + token},
    ).then((http.Response response) {
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }

      return json.decode(response.body);
    });
  }
}
