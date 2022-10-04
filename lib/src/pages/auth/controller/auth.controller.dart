import 'package:get/get.dart';
import 'package:quitanda/src/constants/storage.keys.dart';
import 'package:quitanda/src/pages.routes/app.pages.dart';
import 'package:quitanda/src/services/utils.services.dart';

import '../../../models/user.model.dart';
import '../repository/auth.repository.dart';
import '../result/auth.result.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  final AuthRepository authRepository = AuthRepository();

  final UtilServices utilServices = UtilServices();

  UserModel user = UserModel();

  @override
  void onInit() {
    super.onInit();

    validateToken();
  }

  void saveTokenAndProceedToBase() {
    // Salvar Token
    utilServices.saveLocalData(
      key: StorageKeys.token,
      data: user.token!,
    );

    // Ir para Home Screen
    Get.offAllNamed(PagesRoutes.baseRoute);
  }

  Future<void> validateToken() async {
    String? token = await utilServices.getLocalData(key: StorageKeys.token);

    if (token == null) {
      Get.offAllNamed(PagesRoutes.signInRoute);
      return;
    }

    AuthResult result = await authRepository.validateToken(token);

    result.when(
      success: (user) {
        this.user = user;
        saveTokenAndProceedToBase();
      },
      error: (message) {
        signOut();
      },
    );
  }

  Future<void> signOut() async {
    // Zerar o user
    user = UserModel();

    // Remover o token localmente
    await utilServices.removeLocalData(key: StorageKeys.token);

    // Navegar até a tela de Login
    Get.offAllNamed(PagesRoutes.signInRoute);
  }

  Future<void> signIn({required String email, required String password}) async {
    isLoading.value = true;

    AuthResult result =
        await authRepository.signin(email: email, password: password);

    isLoading.value = false;

    result.when(
      success: (user) {
        this.user = user;

        saveTokenAndProceedToBase();
      },
      error: (message) {
        utilServices.showToast(
          message: message,
          isError: true,
        );
      },
    );
  }

  Future<void> signUp() async {
    isLoading.value = true;

    final AuthResult result = await authRepository.signUp(user);

    isLoading.value = false;

    result.when(
      success: (user) {
        this.user = user;

        saveTokenAndProceedToBase();
      },
      error: (message) {
        utilServices.showToast(
          message: message,
          isError: true,
        );
      },
    );
  }

  Future<void> resetPassword(String email) async {
    await authRepository.resetPassword(email);
  }
}
