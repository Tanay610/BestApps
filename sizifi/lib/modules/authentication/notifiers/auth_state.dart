import 'package:appwrite/models.dart' as appwrite_models;
import 'package:sizifi/core/config/constants.dart';
import 'package:appwrite/models.dart' as models;
import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';
import 'package:uuid/uuid.dart';
import 'package:sizifi/modules/authentication/models/user.dart';

class AuthState extends ChangeNotifier {
  Client client = Client();
  late Account account;
  late Functions functions;
  bool _initiated = false;
  bool _isLoggedIn = false;
  final bool _isLoaded = false;
  late User _user;
  String _error = "";
  late BuildContext _context;
  set setContext(BuildContext context) {
    _context = context;
  }

  bool get isLoaded => _isLoaded;
  bool get isLoggedIn => _isLoggedIn;
  bool get initiated => _initiated;
  User get user => _user;
  String get error => _error;
  set setError(String error) {
    _error = error;
    notifyListeners();
  }

  String? userData;

  AuthState() {
    _init();
  }
  _init() {
    _isLoggedIn = false;
    client
        .setEndpoint(AppConstants.endpoint)
        .setProject(AppConstants.projectId);
    account = Account(client);
    functions = Functions(client);
    // try {
    _checkIsLoggedIn();
  }

  _checkIsLoggedIn() async {
    try {
      _user = await getAccount();

      // _isLoggedIn = true;

      _initiated = true;
      notifyListeners();
    } catch (e) {
      _initiated = true;
      _isLoggedIn = false;
      notifyListeners();
      // print(e.toString());
    }
  }

  Future<User> getAccount() async {
    // print("Getting account");
    // try {
    try {
      models.User res = await account.get();

      if (res.email != "") {
        User us = User.fromJson(res);
        _isLoggedIn = true;
        print(us.id);
        await functions
            .createExecution(
                functionId: '63a98f998cab2a8c904f',
                data: '{"userId":"${us.id}"}')
            // .then((value) => print(value.response));
            .then((value) {
          userData = value.response;

          //Provider.of<StoreState>(_context, listen:false).getStores(value.response);
        });
        notifyListeners();
        return us;
      } else {
        _isLoggedIn = false;
      }
    } catch (e) {
      _isLoggedIn = false;
      print(e);
    }
    throw "Error";
  }

  editAccount(String? name, String? email, String? password,
      String? oldpassword, Map<String, dynamic>? preferences) async {
    try {
      if (name != null && name != user.name) {
        //TODO update name
        Future result = account.updateName(name: name);
        result.then((value) {
          _user.name = name;
        });
      }
      if (email != null && email != user.email && oldpassword != null) {
        //TODO update email
        Future result =
            account.updateEmail(email: email, password: oldpassword);
        result.then((value) {
          _user.email = email;
          // _user.password = oldpassword;
        });
      }
      print("pass : $password");
      print("oldpass : $oldpassword");
      if (password != null && password.isNotEmpty && oldpassword != "") {
        print("updating password");
        //TODO update password
        var result = await account.updatePassword(
            password: password, oldPassword: oldpassword);

        if (result.email != "") {
          return true;
        }
        // result.then((value) {
        //   print(value);
        //   // _user.password = password;
        // });
      }
      models.Preferences pref = models.Preferences(data: preferences!);
      Future result = account.updatePrefs(prefs: pref.data);
      result.then((value) {
        _user.preferences = pref;
      });

      notifyListeners();
    } on AppwriteException catch (e) {
      print(e);
      _error = e.message.toString();
      notifyListeners();
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  recovery(String email, String url) async {
    Future result = account.createRecovery(email: email, url: url);
    print(result);
  }

  login(String email, String password) async {
    // bool success = false;
    Future result =
        account.createEmailSession(email: email, password: password);
    result.then((response) async {
      await getAccount();
      // print(_user);
      // _isLoggedIn = true;

      // _error = "";
      // notifyListeners();
      // success = true;
    }).catchError((error) {
      print(error);
      _error = error.toString();
      notifyListeners();
    });

    return result;
  }

  logout() async {
    try {
      await account.deleteSessions();
      // print(res.toString());
      _isLoggedIn = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  createAccount(String name, String email, String password, String number,
      String countryCode, String country, bool login) async {
    try {
      var userId = const Uuid();
      //String _number = number;
      models.User result = await account.create(
          userId: userId.v1(), email: email, password: password, name: name);
      if (login) {
        Future result1 =
            account.createEmailSession(email: email, password: password);
        print(result1);

        result1.then((response) async {
          try {
            _user = await getAccount();
            print(_user);
            _isLoggedIn = true;

            models.Preferences pref = _user.preferences;
            pref.data["number"] = number;
            pref.data["country"] = country;
            pref.data["countryCode"] = countryCode;

            await editAccount(null, null, null, null, pref.data);
          } catch (e) {
            _error = e.toString();
            notifyListeners();
            print(e);
          }
        }).catchError((error) {
          print(error);
          // return false;
        });
      } else {
        return User(
          id: userId.v1(),
          email: email,
          registration:
              DateTime.tryParse(result.registration)!.millisecondsSinceEpoch,
          name: name,
          preferences: result.prefs,
        );
      }

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

//  Future<bool> checkOldPassword(String userId, String oldPassword) async {
//   try {
//     final response = await functions.createExecution(
//       functionId: 'your_function_id',
//       data: '{"userId": "$userId", "oldPassword": "$oldPassword"}',
//     );
//     return response.success;
//   } catch (e) {
//     // Handle any errors
//     return false;
//   }
// }
  Future<bool> checkOldPassword(String userId, String oldPassword) async {
    try {
      print(userId);
      final response = await functions.createExecution(
        functionId: '63a98f998cab2a8c904f',
        data: '{"userId": "$userId", "oldPassword": "$oldPassword"}',
      );

      final execution = response;
      print("checked");
      return execution.status == 'completed';
    } catch (e) {
      // Handle any errors
      return false;
    }
  }
}
