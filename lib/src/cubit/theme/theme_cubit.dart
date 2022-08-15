import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:tmdb_app/src/repository/preference_repository.dart';

part 'theme_cubit.freezed.dart';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final SharedPreferencesRepository preferencesRepository;
  ThemeCubit({
    required this.preferencesRepository,
  }) : super(const ThemeState.initial());

  Future<void> decideOnTheme() async {
    try {
      int currentTheme = await preferencesRepository.getTheme();

      emit(ThemeState.loaded(theme: currentTheme));
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> switchToLightMode() async {
    try {
      preferencesRepository.setTheme(0);
      emit(const ThemeState.loaded(theme: 0));
    } catch (e) {
      throw Exception(e);
    }
    emit(const ThemeState.loaded(theme: 0));
  }

  Future<void> switchToDarkMode() async {
    try {
      preferencesRepository.setTheme(1);
      emit(const ThemeState.loaded(theme: 1));
    } catch (e) {
      throw Exception(e);
    }
    emit(const ThemeState.loaded(theme: 1));
  }

  Future<void> switchToSystemMode() async {
    try {
      preferencesRepository.setTheme(2);
      emit(const ThemeState.loaded(theme: 2));
    } catch (e) {
      throw Exception(e);
    }
    emit(const ThemeState.loaded(theme: 2));
  }

  Future<void> toggleTheme() async {
    try {
      int currentTheme = await preferencesRepository.getTheme();
      if (currentTheme == 0) {
        await preferencesRepository.setTheme(1);
        emit(const ThemeState.loaded(theme: 1));
      } else {
        await preferencesRepository.setTheme(0);
        emit(const ThemeState.loaded(theme: 0));
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
