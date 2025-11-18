# Repository Guidelines

## Project Structure & Module Organization
`lib/main.dart` boots the app and wires the tab scaffold, while feature code lives in `lib/pages/` (`chat/`, `contacts/`, `discover/`, `profile/`) with shared UI in `lib/widgets/`. Data models remain in `lib/models/`, and platform shells stay under `android/`, `ios/`, `macos/`, `linux/`, `windows/`, `web/`, and `ohos/`. Keep preview assets beside the widgets that use them, and mirror page-level directories inside `test/` so every view or widget has a peer test suite. Manage dependencies and fonts through `pubspec.yaml`, and adjust linting via `analysis_options.yaml`.

## Build, Test, and Development Commands
- `flutter pub get` — sync packages declared in `pubspec.yaml`.
- `flutter run -d <device>` — run the full app on a connected simulator (e.g., `flutter run -d chrome` for web).
- `flutter analyze` — enforce the Flutter lint set before opening a pull request.
- `flutter test` — execute all Dart and widget tests under `test/`.
- `flutter format lib/**/*.dart test/**/*.dart` — ensure standardized formatting; include generated files only when necessary.
- `flutter precache --macos` — run once when targeting macOS to fetch xcframework artifacts.

## Coding Style & Naming Conventions
The project inherits `package:flutter_lints/flutter.yaml`, with const-related rules relaxed to keep layouts readable; use `const` where obvious but do not fight the exemption when stateful data is required. Follow Dart defaults: two-space indentation, `snake_case.dart` files, `UpperCamelCase` classes, `lowerCamelCase` members, and prefix private helpers with `_`. Favor composition-friendly widgets, extract shared UI into `lib/widgets/`, and use `debugPrint` for noisy logs because `avoid_print` is disabled.

## Testing Guidelines
Widget and unit specs belong in `test/`, mirroring the `lib/` tree (`test/pages/chat/chat_list_page_test.dart`, etc.). Group tests by widget or service, write descriptive `testWidgets` titles, and prefer pumping minimal scaffolds that reflect actual navigation stacks. Aim for ≥80% line coverage on touched files, and run `flutter test --coverage` when preparing a release branch. When adding new screens, include at least one golden or interaction test covering primary states.

## Commit & Pull Request Guidelines
The distributed snapshot lacks Git history, so adopt Conventional Commit prefixes (`feat:`, `fix:`, `chore:`) to keep logs filterable. Keep messages in the imperative, wrap body text at 72 characters, and mention ticket IDs when applicable. Each PR should link the relevant issue, summarize functional changes, list entry points touched (e.g., `lib/pages/discover/discover_page.dart`), attach screenshots for UI tweaks, and confirm that `flutter analyze`, `flutter test`, and device smoke tests have been executed locally.
