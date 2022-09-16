import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tmdb_app/src/di/setup_providers.dart';
import 'package:tmdb_app/src/di/setup_repository.dart';
import 'package:tmdb_app/src/utils/cubit_observer.dart';
import 'package:tmdb_app/tmdb.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/.env");
  Bloc.observer = MyBlocObserver();
  HydratedBlocOverrides.runZoned(
    () {},
    storage: await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getTemporaryDirectory(),
    ),
  );

  //
  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    );
  }

  //
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  //
  runApp(
    MultiRepositoryProvider(
      providers: setupRepository(),
      child: setupProviders(
        const MyApp(),
      ),
    ),
  );
}
