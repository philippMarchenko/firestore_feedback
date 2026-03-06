# firestore_feedback

A self-contained Flutter package that drops a fully-featured **feedback screen** into any Flutter app backed by **Cloud Firestore**.

---

## Features

- 📝 Three feedback types: **Suggestion**, **Bug**, **Other**
- ✉️ Optional email field
- 🎬 Lottie animation (bundled – no extra setup)
- 🔥 Writes to your Firestore collection with app metadata (version, platform, …)
- 🌍 All UI strings overridable for localisation
- Single call to show the screen: `FeedbackSDK.show(context)`

---

## Prerequisites

Your host app must initialise Firebase before calling `FeedbackSDK.show`:

```dart
await Firebase.initializeApp();
```

---

## Installation

### Path dependency (monorepo / local development)

```yaml
# pubspec.yaml
dependencies:
  firestore_feedback:
    path: ../packages/firestore_feedback
```

### Git dependency

```yaml
dependencies:
  firestore_feedback:
    git:
      url: https://github.com/your-org/firestore_feedback.git
      ref: main
```

---

## Usage

```dart
import 'package:firestore_feedback/firestore_feedback.dart';

// Simplest – uses 'suggestions' collection and default English strings
FeedbackSDK.show(context);

// Custom Firestore collection
FeedbackSDK.show(context, collectionPath: 'app_feedback');

// Override UI labels (e.g., for localisation)
FeedbackSDK.show(
  context,
  strings: FeedbackStrings(
    title: 'Give Feedback',
    welcomeMessage: 'We'd love to hear from you',
    submitButton: 'Submit',
  ),
);
```

You can also embed `FeedbackPage` directly inside a `go_router` route:

```dart
GoRoute(
  path: '/feedback',
  builder: (context, state) => FeedbackPage(
    repository: SuggestionsRepository(collectionPath: 'suggestions'),
    strings: const FeedbackStrings(),
  ),
),
```

---

## FeedbackStrings reference

| Field | Default |
|---|---|
| `title` | `'Feedback'` |
| `welcomeMessage` | `'Share your thoughts'` |
| `typeSuggestion` | `'Suggestion'` |
| `typeBug` | `'Bug'` |
| `typeOther` | `'Other'` |
| `emailHint` | `'Email (optional)'` |
| `detailsLabel` | `'Details'` |
| `detailsHint` | `'Describe your feedback…'` |
| `submitButton` | `'Send'` |
| `successMessage` | `'Thank you for your feedback!'` |
| `errorMessage` | `'Failed to send feedback. Please try again.'` |

---

## Firestore document schema

Each submission creates a document with:

| Field | Type | Notes |
|---|---|---|
| `type` | String | `'Suggestion'`, `'Bug'`, or `'Other'` |
| `text` | String | User's message |
| `email` | String | Empty string if not provided |
| `timestamp` | Timestamp | Server timestamp |
| `appName` | String | From `package_info_plus` |
| `packageName` | String | |
| `appVersion` | String | |
| `buildNumber` | String | |
| `platform` | String | `'android'`, `'ios'`, etc. |
| `read` | Boolean | Always `false` on creation |

---

## License

MIT

