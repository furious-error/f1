import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f1_stats/bloc/qualifying_result/qualifying_result_bloc.dart';
import 'package:f1_stats/bloc/race_result/race_result_bloc.dart';
import 'package:f1_stats/bloc/sprint_result/sprint_result_bloc.dart';
import 'package:f1_stats/firebase_auth/firebase_auth_provider.dart';
import 'package:f1_stats/helper/loading_screen.dart';
import 'package:f1_stats/homepage.dart';
import 'package:f1_stats/pages/register_login/forgot_password_page.dart';
import 'package:f1_stats/pages/register_login/login_page.dart';
import 'package:f1_stats/pages/register_login/register_page.dart';
import 'package:f1_stats/pages/register_login/verify_email.dart';
import 'package:f1_stats/resources/api_repository/qualifying_results_api_repository.dart';
import 'package:f1_stats/resources/api_repository/race_result_api_repository.dart';
import 'package:f1_stats/resources/api_repository/sprint_result_api_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/auth/auth_bloc.dart';
import 'bloc/auth/auth_event.dart';
import 'bloc/auth/auth_state.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        // RepositoryProvider(
        //   create: (context) => FirebaseAuthProvider(),
        //   lazy: true,
        // ),
        RepositoryProvider(
          create: (context) => RaceResultApiRepository(),
          lazy: true,
        ),
        RepositoryProvider(
          create: (context) => QualifyingResultApiRepository(),
          lazy: true,
        ),
        RepositoryProvider(
          create: (context) => SprintResultApiRepository(),
          lazy: true,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          // BlocProvider<AuthBloc>(
          //   create: (context) => AuthBloc(FirebaseAuthProvider()),
          // ),
          BlocProvider(
            create: (context) => RaceResultBloc(RaceResultApiRepository()),
          ),
          BlocProvider(
            create: (context) =>
                QualfyingResultBloc(QualifyingResultApiRepository()),
          ),
          BlocProvider(
            create: (context) =>
                SprintResultBloc(SprintResultApiRepository()),
          ),
        ],
        child: const MaterialApp(home: HomePage(), debugShowCheckedModeBanner: false,),
      ),
    );
  }
}

class StartupPage extends StatelessWidget {
  const StartupPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(const AuthEventInitialize());
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.isLoading) {
          LoadingScreen().show(
            context: context,
            text: state.loadingText ?? 'Please wait a moment',
          );
        } else {
          LoadingScreen().hide();
        }
      },
      builder: (context, state) {
        if (state is AuthStateLoggedIn) {
          return const HomePage();
        } else if (state is AuthStateNeedsVerification) {
          return const VerifyEmailPage();
        } else if (state is AuthStateLoggedOut) {
          return const LoginPage();
        } else if (state is AuthStateForgotPassword) {
          return const ForgotPasswordPage();
        } else if (state is AuthStateRegistering) {
          return const RegisterPage();
        } else {
          return const Scaffold(
            body: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
