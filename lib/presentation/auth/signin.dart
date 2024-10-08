import 'package:assignment/constants/app_textstyle.dart';
import 'package:assignment/presentation/widgets/AppTextField.dart';
import 'package:assignment/presentation/widgets/custom_appbar.dart';
import 'package:assignment/presentation/widgets/custom_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/assets.dart';
import '../../constants/strings.dart';
import '../widgets/app_colors.dart';
import '../widgets/loader.dart';
import 'controller/signin_controller.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SignInController controller = Get.put(SignInController()); // Initialize controller

    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: const CustomAppBar(
        title: Strings.signIn,
      ),
      body: Obx(() => controller.isLoading.value
          ? const LoaderWidget()
          : SingleChildScrollView(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Center(
                child: SizedBox(
                  height: 75,
                  width: 173,
                  child: Image.asset(Assets.appLogo),
                ),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(20),
                child: AppTextField(
                  label: Strings.email,
                  hint: Strings.email,
                  enableColor: AppColor.black,
                  borderRadius: 10,
                  enabled: true,
                  onChanged: (value) {
                    controller.email.value = value;  // Update email in the controller
                  },
                  validator: controller.emailValidator,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: AppTextField(
                  label: Strings.password,
                  hint: Strings.password,
                  enableColor: AppColor.black,
                  borderRadius: 10,
                  enabled: true,
                  onChanged: (value) {
                    controller.password.value = value;  // Update password in the controller
                  },
                  validator: controller.passwordValidator,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    Strings.forgotPassword,
                    style: AppTextStyle.forgotPassword,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.isChecked.value = !controller.isChecked.value;  // Toggle checkbox state
                      },
                      child: Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(
                            color: AppColor.hintColor,
                            width: 1,
                          ),
                        ),
                        child: controller.isChecked.value
                            ? const Icon(
                          Icons.check,
                          size: 12,
                          color: Colors.black,
                        )
                            : null,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      Strings.checkBoxText,
                      style: AppTextStyle.checkBoxText,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RichText(
                  text: TextSpan(
                    text: Strings.dontHaveAnAccount,
                    style: AppTextStyle.dontHaveAnAccount,
                    children: [
                      TextSpan(
                        text: ' Sign Up',
                        style: AppTextStyle.signUpText,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Navigate to Sign Up page
                          },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 70),
              CustomButton(
                text: Strings.logIn,
                gradientColors: const [
                  AppColor.buttonColor1,
                  AppColor.buttonColor2
                ],
                onPressed: controller.login,  // Call login method from the controller
              ),
            ],
          ),
        ),
      )),
    );
  }
}
