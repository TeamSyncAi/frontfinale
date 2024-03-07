import 'package:flutter/cupertino.dart';
import 'package:teamsyncai/model/user_model.dart';
import 'package:teamsyncai/services/userapiservice.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier {
  final List<User> _users = [];
  String _invitationStatus = '';

  List<User> get users => _users;
  String get invitationStatus => _invitationStatus;

Future<User> createUser(String username, String email, String numTel, String password) async {
    try {
      final User newUser = await UserApiService.createUser(username, email, numTel,password );
      
 
      
      return newUser;
    } catch (e) {
      
      print('Failed to create user: $e');
      throw Exception('Failed to create user');
    }
  }
  Future<User> authenticateUser(String username, String password) async {
    final User user = await UserApiService.authenticateUser(username, password);

   
    final SharedPreferences prefs = await SharedPreferences.getInstance();
  //  await prefs.setString('userId', user.id); // Assuming 'id' is a field in your User model

    notifyListeners(); 
    return user;
  }

  Future<User> getUserDetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String userId = prefs.getString('userId') ?? '';
    return UserApiService.fetchUserProfile(userId);
  }

  Future<void> sendCredentialsByEmail(String adminEmail) async {
    try {
      _invitationStatus = 'Sending credentials...';
      notifyListeners();

      await UserApiService.sendCredentialsByEmail(adminEmail);

      _invitationStatus = 'Credentials sent successfully';
      notifyListeners();
    } catch (e) {
      _invitationStatus = 'Failed to send credentials';
      notifyListeners();
    }
  }

 
}