import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';

/// A page that allows users to sign in or sign up.
class SignInPage extends StatefulWidget {
  /// Creates an instance of [SignInPage].
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isSignIn = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              state.maybeWhen(
                operationInProgress: () => const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
                authError: (failure) => ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Center(
                      child: Text(failure.toString()),
                    ),
                  ),
                ),
                orElse: () => const SizedBox.shrink(),
              );
            },
            builder: (_, state) {
              return Column(
                mainAxisAlignment: .center,
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        const Text('Email'),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          autofocus: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Write your email';
                            }
                            // if (!value.contains(RegExp(r''))) {
                            //   return 'Incorrect email format';
                            // }
                            return null;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            hintText: 'aaa@gmail.com',
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text('Password'),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: !_isPasswordVisible,
                          autocorrect: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Write your password';
                            }
                            // if (!value.contains(RegExp(r''))) {
                            //   return 'Incorrect password format';
                            // }
                            return null;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            hintText: '•' * 8,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  debugPrint(_isPasswordVisible.toString());
                                  _isPasswordVisible = !_isPasswordVisible;
                                  debugPrint(_isPasswordVisible.toString());
                                });
                              },
                              icon: _isPasswordVisible
                                  ? const Icon(Icons.visibility_rounded)
                                  : const Icon(Icons.visibility_off_rounded),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<AuthBloc>().add(
                                  _isSignIn
                                      ? AuthEvent.signInRequested(
                                          _emailController.text.trim(),
                                          _passwordController.text.trim(),
                                        )
                                      : AuthEvent.signUpRequested(
                                          _emailController.text.trim(),
                                          _passwordController.text.trim(),
                                        ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: _isSignIn ? const Text('Sign In') : const Text('Sign Up'),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Center(
                          child: RichText(
                            text: TextSpan(
                              text: _isSignIn ? 'Sign Up' : 'Sign In',
                              style: const TextStyle(color: Colors.black),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => setState(() {
                                  _isSignIn = !_isSignIn;
                                }),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
