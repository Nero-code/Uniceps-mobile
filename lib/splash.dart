import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/presentation/profile/cubit/profile_cubit.dart';
import 'package:uniceps/core/constants/app_routes.dart';
import 'package:uniceps/injection_dependency.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(sl())..getProfile(),
      lazy: false,
      child: BlocListener<ProfileCubit, ProfileState>(
        listener: (context, state) => state.when(
          initial: () => null,
          notFound: () => Navigator.pushReplacementNamed(context, AppRoutes.profileInitial),
          found: () => Navigator.pushReplacementNamed(context, AppRoutes.home),
        ),
        child: Scaffold(
          body: Center(
            child: Image(
                image: const AssetImage('images/logo/Logo.png'),
                height: MediaQuery.sizeOf(context).width * 0.3,
                width: MediaQuery.sizeOf(context).width * 0.3),
          ),
        ),
      ),
    );
  }
}
