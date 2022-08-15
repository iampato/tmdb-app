import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_app/src/cubit/theme/theme_cubit.dart';
import 'package:tmdb_app/src/repository/preference_repository.dart';

Widget setupProviders(Widget child) {
  return MultiBlocProvider(
    providers: [
      // Theme
      BlocProvider(
        create: (context) {
          return ThemeCubit(
            preferencesRepository: SharedPreferencesRepository(),
          )..decideOnTheme();
        },
      ),
    ],
    child: child,
  );
}
