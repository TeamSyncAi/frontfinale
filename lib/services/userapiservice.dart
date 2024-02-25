import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:teamsyncai/model/user_model.dart';

class UserApiService {
  static const String baseUrl = "http://192.168.1.167:3000";


static Future<User> authenticateUser(String username, String password) async {
  try {
    final Uri requestUri = Uri.parse('$baseUrl/user/loginclient');
    final Map<String, String> requestBody = {
      'username': username,
      'password': password,
    };

    final http.Response response = await http.post(
      requestUri,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(requestBody),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return User.fromJson(responseData['user']);
    } else {
      throw Exception('Authentication failed with status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Authentication failed with error: $e');
    throw Exception('Authentication failed');
  }
}


  static Future<User> fetchUserProfile(String userId) async {
    final Uri requestUri = Uri.parse('$baseUrl/user/profile/$userId');

    final http.Response response = await http.get(
      requestUri,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return User.fromJson(responseData);
    } else {
      throw Exception('Failed to fetch user profile');
    }
  }

  // Method to send credentials by email (assuming an endpoint exists for this)
  static Future<void> sendCredentialsByEmail(String adminEmail) async {
    final Uri requestUri = Uri.parse('$baseUrl/sendCredentials');
    final Map<String, String> requestBody = {
      'adminEmail': adminEmail,
    };

    final http.Response response = await http.post(
      requestUri,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(requestBody),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to send credentials by email');
    }
  }
  static Future<User> createUser(String username, String email, String password) async {
    final Uri requestUri = Uri.parse('$baseUrl/user/registerclient');
    final Map<String, String> requestBody = {
      'username': username,
      'email': email,
      'password': password,
    };

    final http.Response response = await http.post(
      requestUri,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(requestBody),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return User.fromJson(responseData);
    } else {
      throw Exception('Failed to create user');
    }
  }
  // Add other methods as needed...
}