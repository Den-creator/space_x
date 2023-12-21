init:
	fvm flutter pub get
	fvm flutter packages pub run build_runner build --delete-conflicting-outputs
	fvm flutter pub run easy_localization:generate -S assets/locale/ -f keys -o locale_keys.g.dart
	fvm flutter pub run easy_localization:generate -S assets/locale/ -f json -o codegen_loader.g.dart