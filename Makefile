init:
	cd app && flutter pub get
	cd cli && dart pub get
	cd internal/annotations && flutter pub get
	cd internal/generators && flutter pub get