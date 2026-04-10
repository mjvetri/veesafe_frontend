import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

/// Represents a registered user stored locally.
class UserModel {
  final String email;
  final String password;
  final String phone;

  UserModel({
    required this.email,
    required this.password,
    required this.phone,
  });

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
        'phone': phone,
      };

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json['email'],
        password: json['password'],
        phone: json['phone'],
      );
}

/// Result wrapper for auth operations.
class AuthResult {
  final bool success;
  final String? errorMessage;

  const AuthResult.success()
      : success = true,
        errorMessage = null;
  const AuthResult.failure(this.errorMessage) : success = false;
}

/// Handles all authentication logic using SharedPreferences as local storage.
class AuthService {
  static const _usersKey = 'registered_users';
  static const _isLoggedInKey = 'isLoggedIn';
  static const _loggedInEmailKey = 'loggedInEmail';
  static const _rememberMeKey = 'rememberMe';
  static const _savedEmailKey = 'savedEmail';
  static const _savedPasswordKey = 'savedPassword';

  // ─── Session ────────────────────────────────────────────────────────────────

  /// Returns true if a user session is currently active.
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedInKey) ?? false;
  }

  /// Returns the email of the currently logged-in user, or null.
  static Future<String?> getLoggedInEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_loggedInEmailKey);
  }

  // ─── User store helpers ──────────────────────────────────────────────────────

  static Future<List<UserModel>> _getAllUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_usersKey);
    if (raw == null) return [];
    final List<dynamic> decoded = jsonDecode(raw);
    return decoded.map((e) => UserModel.fromJson(e)).toList();
  }

  static Future<void> _saveAllUsers(List<UserModel> users) async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = jsonEncode(users.map((u) => u.toJson()).toList());
    await prefs.setString(_usersKey, encoded);
  }

  // ─── Sign Up ─────────────────────────────────────────────────────────────────

  /// Registers a new user. Returns failure if the email is already taken.
  static Future<AuthResult> signUp({
    required String email,
    required String password,
    required String phone,
  }) async {
    final users = await _getAllUsers();

    // Check for duplicate email (case-insensitive)
    final exists = users.any(
      (u) => u.email.toLowerCase() == email.toLowerCase(),
    );
    if (exists) {
      return const AuthResult.failure(
        'An account with this email already exists.',
      );
    }

    users.add(UserModel(email: email, password: password, phone: phone));
    await _saveAllUsers(users);

    // Auto-login after registration
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isLoggedInKey, true);
    await prefs.setString(_loggedInEmailKey, email);

    return const AuthResult.success();
  }

  // ─── Login ────────────────────────────────────────────────────────────────────

  /// Validates credentials and opens a session on success.
  static Future<AuthResult> login({
    required String email,
    required String password,
    bool rememberMe = false,
  }) async {
    final users = await _getAllUsers();

    final user = users.cast<UserModel?>().firstWhere(
          (u) =>
              u!.email.toLowerCase() == email.toLowerCase() &&
              u.password == password,
          orElse: () => null,
        );

    if (user == null) {
      return const AuthResult.failure('Invalid email or password.');
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isLoggedInKey, true);
    await prefs.setString(_loggedInEmailKey, user.email);

    // Handle "Remember Me"
    if (rememberMe) {
      await prefs.setString(_savedEmailKey, email);
      await prefs.setString(_savedPasswordKey, password);
      await prefs.setBool(_rememberMeKey, true);
    } else {
      await prefs.remove(_savedEmailKey);
      await prefs.remove(_savedPasswordKey);
      await prefs.setBool(_rememberMeKey, false);
    }

    return const AuthResult.success();
  }

  // ─── Logout ───────────────────────────────────────────────────────────────────

  /// Clears the active session. Remembered credentials are kept if set.
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isLoggedInKey, false);
    await prefs.remove(_loggedInEmailKey);
  }

  // ─── Remember Me ─────────────────────────────────────────────────────────────

  /// Returns saved credentials if "Remember Me" was enabled.
  static Future<({String email, String password, bool rememberMe})>
      getSavedCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    return (
      email: prefs.getString(_savedEmailKey) ?? '',
      password: prefs.getString(_savedPasswordKey) ?? '',
      rememberMe: prefs.getBool(_rememberMeKey) ?? false,
    );
  }
}