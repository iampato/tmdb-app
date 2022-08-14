icons:
		flutter pub run flutter_launcher_icons:main

splash:
		flutter pub run flutter_native_splash:create

pub:
		flutter pub get

gen:
		flutter packages run build_runner build --delete-conflicting-outputs

fmt:
		flutter format lib test

apk:
		flutter build apk --release

appBundle:
		flutter build appbundle --release

activaterename:
		flutter pub global activate rename

packagename-android:
		flutter pub global run rename --bundleId me.iampato.tmdb --target android

packagename-ios:
		flutter pub global run rename --bundleId me.iampato.tmdb  --target ios

appname:
		flutter pub global run rename --appname "Tmdb Movies"