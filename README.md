## Running This Example

https://user-images.githubusercontent.com/25312848/125111829-ffc40d00-e0ab-11eb-9843-08ec050b14c8.mov

A flutter project that uses okta to login.

This is a sample project for the okta sdk https://github.com/sonikro/flutter-okta-sdk.

To run this application, you first need to clone this repo:

```bash
git clone https://github.com/marktefftech/flutter_okta_sample.git
```

Then install dependencies:

```bash
cd flutter_okta_sample
flutter pub get
```

Now you need to gather the following information from the Okta Developer Console:
- **Org URL**
- **Client Id**

 Navigate to /services/AuthService.dart and update the following variables

```ini
static const String OKTA_DOMAIN = '<your-org>.okta.com'; // example.okta.com
static const String OKTA_AUTHORIZER = 'default'; // leave as is
static const String OKTA_CLIENT_ID = '<your-client-id>'; // ex. 0oawpt6r4I737eAOf376
```

With variables set, start the app server:

```bash
flutter run
```

Now navigate to the Pheonix app your simulator
