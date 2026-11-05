# Firebase Authentication App

**CSC 4360 — Mobile App Development**  
**In-Class Activity 13**

## Overview

This Flutter application uses Firebase Authentication to allow users to create an account, sign in, update their password, and sign out. The app automatically switches between the login and profile screens depending on the user's authentication status.

## Features

- Register a new account using email and password
- Sign in with an existing account
- Sign out securely
- Display the signed-in user's email on the profile screen
- Update the account password
- Validate email addresses and password length
- Display error messages for invalid login attempts
- Show loading feedback during authentication requests
- Keep users signed in after restarting the app

## Technologies Used

- Flutter and Dart
- Firebase Authentication
- Firebase Core
- Android

## Project Structure

- `lib/main.dart` — Contains the app interface, authentication forms, profile screen, and authentication-state listener.
- `lib/auth_service.dart` — Handles Firebase Authentication operations, including registration, sign-in, sign-out, password changes, and reauthentication.
- `lib/firebase_options.dart` — Contains the generated Firebase configuration.
- `android/app/google-services.json` — Firebase configuration for the Android application.

## Firebase Setup

1. Create a Firebase project in the Firebase Console.
2. Register the Android application with Firebase.
3. Enable **Email/Password** under Authentication → Sign-in method.
4. Configure the project using FlutterFire CLI.
5. Install the required Flutter dependencies.

The application initializes Firebase before starting and uses `authStateChanges()` to monitor whether a user is signed in.

## How to Run

Make sure Flutter and an Android emulator or device are available.

```bash
flutter pub get
flutter run
```

To build the Android release APK:

```bash
flutter build apk --release
```

The generated APK is located at:

`build/app/outputs/flutter-apk/app-release.apk`

## Testing

I tested the following:

| Test | Result |
|---|---|
| Register a new account | Passed |
| Sign in with a valid account | Passed |
| Sign out | Passed |
| Display the user's email | Passed |
| Update account password | Passed |
| Reject an invalid email | Passed |
| Reject a password shorter than six characters | Passed |
| Reject incorrect login credentials | Passed |
| Restore the session after restarting the app | Passed |
| Prevent access to the profile after signing out | Passed |
| Display loading feedback | Passed |

The application also includes reauthentication handling for password changes that require a recent login. That specific Firebase error condition was implemented but was not triggered during testing.

## Future Improvements

One feature I would add is a forgot-password option that sends a password reset email. This would allow users to recover their accounts without needing to be signed in.

## References

- [Firebase Authentication for Flutter](https://firebase.google.com/docs/auth/flutter/start)
- [Flutter Documentation](https://docs.flutter.dev/)