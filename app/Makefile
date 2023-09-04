phony: clean gen clear_gen_cache

clean:
	flutter clean && flutter pub get && make gen

gen:
	flutter pub run build_runner build --delete-conflicting-outputs

clear_gen_cache:
	rm -rf .dart_tool/build/generated/app/