# mefood

Lao Delivery System

## Command

### Refresh Model Data
flutter pub run build_runner build --delete-conflicting-outputs

### Run with optional model
flutter run --flavor delivery -t lib/delivery.dart<br/>
flutter run --flavor customer -t lib/customer.dart<br/>
flutter run -d chrome -t lib/restaurant.dart

flutter build web --release --web-renderer html -t lib/restaurant.dart


### Run with Restaurant macos app
flutter run

### Run with sever panel
nohup node app.js &<br/>
pkill node

₭

### MacOS version release
create-dmg \
--volname "mefood" \
--window-pos 200 120 \
--window-size 1200 750 \
--icon-size 128 \
--text-size 14 \
--icon "mefood.app" 256 256 \
--hide-extension "mefood.app" \
--app-drop-link 540 250 \
--hdiutil-quiet \
"mefood.dmg" \
"mefood.app"


## Developer Search Key

### Need to add feature
[Future]