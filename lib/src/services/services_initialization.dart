import 'package:get_storage/get_storage.dart';
import 'package:physicians_map/src/authentication/signin/user_model.dart';
import 'package:physicians_map/src/globals.dart';

Future<void> initializeGetStorage() async {
  await GetStorage.init();
  GetStorage authBox = GetStorage('auth');
  final Map<String, dynamic> authModel = authBox.read('authModel') ?? {};
  logger.d(authModel);
  // if (authModel != null) {
  authenticationModel = AuthenticationModel.fromJson(authModel);
  accessToken = authenticationModel.accessToken;
  // }
}
