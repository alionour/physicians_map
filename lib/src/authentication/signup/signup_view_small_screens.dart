import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:physicians_map/src/custom_widgets/loading_button.dart';

import '/src/authentication/signup/sign_up_controller.dart';

class SignUpViewSmallScreens extends StatelessWidget {
  SignUpViewSmallScreens({Key? key}) : super(key: key);
  final SignUpController _signUpController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
            child: Form(
          key: _signUpController.formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: Get.height,
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return getSignUpFormFields().elementAt(index);
                },
                itemCount: getSignUpFormFields().length,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
              ),
            ),
          ),
        )),
      ),
    );
  }

  List<Widget> getSignUpFormFields() {
    return [
      TextFormField(
        controller: _signUpController.firstNameController,
        focusNode: _signUpController.firstNameFocusNode,
        autofocus: true,
        decoration: const InputDecoration(labelText: 'First Name'),
        validator: (value) {
          if (value!.isEmpty) {
            return 'First name can not be empty';
          }
        },
        onFieldSubmitted: (String value) {
          _signUpController.middleNameFocusNode.requestFocus();
        },
      ),
      TextFormField(
        controller: _signUpController.middleNameController,
        focusNode: _signUpController.middleNameFocusNode,
        decoration: const InputDecoration(labelText: 'Middle Name'),
        onFieldSubmitted: (String value) {
          _signUpController.lastNameFocusNode.requestFocus();
        },
      ),
      TextFormField(
        controller: _signUpController.lastNameController,
        focusNode: _signUpController.lastNameFocusNode,
        decoration: const InputDecoration(labelText: 'Last Name'),
        onFieldSubmitted: (String value) {
          _signUpController.usernameFocusNode.requestFocus();
        },
        validator: (value) {
          if (value!.isEmpty) {
            return 'Last name can not be empty';
          }
        },
      ),
      TextFormField(
        controller: _signUpController.usernameController,
        focusNode: _signUpController.usernameFocusNode,
        decoration: const InputDecoration(labelText: 'Username'),
        onFieldSubmitted: (String value) {
          _signUpController.mailFocusNode.requestFocus();
        },
        validator: (value) {
          if (value!.isEmpty) {
            return 'Username can not be empty';
          }
          if (_signUpController.isUsernameTaken.isTrue) {
            return 'Username is not available';
          }
        },
        onChanged: (value) {
          _signUpController.isUsernameTaken.value = false;
        },
      ),
      TextFormField(
        controller: _signUpController.mailController,
        focusNode: _signUpController.mailFocusNode,
        decoration: const InputDecoration(
          labelText: 'E-Mail',
        ),
        keyboardType: TextInputType.emailAddress,
        onFieldSubmitted: (String value) {
          _signUpController.passwordFocusNode.requestFocus();
        },
        validator: (value) {
          if (value!.isEmpty) {
            return 'E-Mail can not be empty';
          }
          if (_signUpController.isEmailTaken.isTrue) {
            return 'Email is already registered';
          }
        },
        onChanged: (value) {
          _signUpController.isEmailTaken.value = false;
        },
      ),
      TextFormField(
        controller: _signUpController.passwordController,
        focusNode: _signUpController.passwordFocusNode,
        decoration: const InputDecoration(
          labelText: 'Password',
        ),
        keyboardType: TextInputType.visiblePassword,
        onFieldSubmitted: (String value) {
          _signUpController.confirmPasswordFocusNode.requestFocus();
        },
        obscureText: true,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Password can not be empty';
          }
          if (value.length < 8) {
            return 'Password should contain at least 8 characters';
          }
          if (!value.contains(RegExp(
              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'))) {
            return 'Password should contain:\nOne Upper Case\nOne Lower Case\nOne Special Character\nOne Digit';
          }
        },
      ),
      TextFormField(
        controller: _signUpController.confirmPasswordController,
        focusNode: _signUpController.confirmPasswordFocusNode,
        decoration: const InputDecoration(
          labelText: 'Confirm Password',
        ),
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        onFieldSubmitted: (String value) => _signUpController.signUp(),
        validator: (value) {
          if (value != _signUpController.passwordController.text) {
            return 'Passwords do not match';
          }
        },
      ),
      FormField<bool>(
        builder: (FormFieldState<bool> state) => Obx(
          () => CheckboxListTile(
            value: _signUpController.agreedToTerms.value,
            onChanged: (value) {
              _signUpController.agreedToTerms.value = value ?? false;
              print(value);

              state.didChange(value);
            },
            title: const Text('I have read and accept terms.'),
            subtitle: (state.hasError) ? Text(state.errorText ?? '') : null,
          ),
        ),
        initialValue: _signUpController.agreedToTerms.value,
        validator: (value) {
          if (_signUpController.agreedToTerms.isFalse) {
            return 'You have to accept the terms';
          }
        },
      ),
      LoadingButton(onPressed: _signUpController.signUp, text: 'Sign Up')
    ];
  }
}
