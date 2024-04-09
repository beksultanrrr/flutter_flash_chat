// // ignore_for_file: constant_identifier_names

// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';


// final sharedPreference = SharedPreferenceHelper();

// class SharedPreferenceHelper {
//   late SharedPreferences _sharedPreference;
//   static const String AUTH = 'auth';
//   static const String PROFILE = 'profile';
//   static const String SID = 'sid';
//   static const String USER = 'user';
//   static const String ADDRESSES = 'addresses';
//   static const String CATEGORIES = 'categories';

//   init() async {
//     _sharedPreference = await SharedPreferences.getInstance();
//   }

//   Future<void> clear() async {
//     await _sharedPreference.clear();
//   }

//   bool get isAuthenticated {
//     return getToken != null;
//   }

//   Future<void> saveToken(DataToken token) async {
//     _sharedPreference.setString(AUTH, jsonEncode(token.toJson()));
//   }

//   Future<void> updateToken(String newAccessToken) async {
//     String? token = _sharedPreference.getString(AUTH);
//     Token fullToken = Token.fromJson(jsonDecode(token!));
//     fullToken.accessToken = newAccessToken;

//     _sharedPreference.setString(AUTH, jsonEncode(fullToken.toJson()));
//   }

//   DataToken? get getToken {
//     String? token = _sharedPreference.getString(AUTH);
//     if (token == null) return null;
//     return DataToken.fromJson(jsonDecode(token));
//   }

//   Future<void> saveUser(User user) async {
//     _sharedPreference.setString(USER, jsonEncode(user.toJson()));
//   }

//   // User? get getUser {
//   //   String? user = _sharedPreference.getString(USER);
//   //   if (user == null) return null;
//   //   return User.fromJson(jsonDecode(user));
//   // }

// }
