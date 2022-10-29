# dynamic_launcher_icon

A flutter plugin to dynamically change launcher icons. Currently only for Android, support for more platforms are on their way.

## Why this plugin and not others?

This plugin is primarily developed to address launcher icon switching issue for Android, because it is very straightforward for iOS. There are some plugins which will switch the icon, but will cause a crash first. This is because of this [flutter issue](https://github.com/tastelessjolt/flutter_dynamic_icon/pull/10#issuecomment-959260628)

## The problem

If switching the app icon crashes the app, then switching it when the app closes would circumvent the issue altogether. Sadly that is not straightforward. An app can be killed by

- Exiting the app by pressing back
- Killing it from the app switch view
- Killed by system after it is in background for long enough

One may be tempted to place the icon switching logic inside `onStop()` or `onDestroy()` inside the activity, but as per [android documentation](<https://developer.android.com/reference/android/app/Activity#onDestroy()>) they are not guaranteed to be called every time.

## The solution

Running a service which is responsible for detecting if the app is closed and triggering the icon change.

- This plugin runs a foreground service once the plugin has been requested to switch the icon.
- When a service is killed, it has an `onTaskRemoved()` callback, which is called every time, we can perform tasks which are not much intensive in here.
- Trigger the app launcher icon change logic.
  ''
