
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/login_form.dart';
import '../cubits/auth_cubit.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
	const LoginScreen({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Login'),
			),
			body: BlocProvider(
				create: (context) => AuthCubit(defaultEmail: 'zharfan@gmail.com', defaultPassword: 'cat'),
				child: BlocListener<AuthCubit, AuthState>(
					listener: (context, state) {
						if (state is Authenticated) {
							Navigator.pushReplacement(
								context,
								MaterialPageRoute(builder: (context) => HomeScreen()),
							);
						} else if (state is AuthError) {
							ScaffoldMessenger.of(context).showSnackBar(
								SnackBar(content: Text(state.message)),
							);
						}
					},
					child: LoginForm(loginButtonText: 'Login Yuk'),
				),
			),
		);
	}
}
