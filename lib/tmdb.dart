import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmdb_app/src/cubit/theme/theme_cubit.dart';
import 'package:tmdb_app/src/utils/app_router.dart';
import 'package:tmdb_app/src/styles/theme.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int theme = 0;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Notflix App',
            theme: ThemeData(
              primarySwatch: materialColor,
              brightness: getTheme(theme),
              fontFamily: GoogleFonts.montserrat().fontFamily,
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: getTheme(theme) == Brightness.dark
                    ? Colors.black
                    : Colors.white,
              ),
              scaffoldBackgroundColor: getTheme(theme) == Brightness.dark
                  ? null
                  : AppTheme.theme(getTheme(theme)).bg1,
            ),
            darkTheme: theme == 2
                ? ThemeData(
                    bottomNavigationBarTheme: BottomNavigationBarThemeData(
                      backgroundColor: Colors.black,
                      selectedItemColor:
                          AppTheme.theme(Brightness.dark).primary,
                    ),
                    primarySwatch: materialColor,
                    brightness: Brightness.dark,
                    fontFamily: GoogleFonts.openSans().fontFamily,
                    // scaffoldBackgroundColor: Colors.black,
                  )
                : null,
            builder: (context, widget) {
              return ResponsiveWrapper.builder(
                ClampingScrollWrapper.builder(context, widget!),
                defaultScale: true,
                minWidth: 480,
                defaultName: MOBILE,
                breakpoints: const [
                  ResponsiveBreakpoint.resize(480, name: MOBILE),
                  ResponsiveBreakpoint.resize(750, name: TABLET),
                  ResponsiveBreakpoint.resize(1000, name: DESKTOP),
                ],
                background: Container(
                  color: AppTheme.theme(getTheme(theme)).bg1,
                ),
              );
            },
            onGenerateRoute: AppRouter.generateRoute,
          );
        },
      ),
      builder: (context, child) {
        return child!;
      },
    );
  }

  Brightness getTheme(int value) {
    if (value == 0) {
      return Brightness.light;
    } else if (value == 1) {
      return Brightness.dark;
    } else {
      return Brightness.light;
    }
  }
}
