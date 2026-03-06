/// Localizable strings for the feedback UI.
///
/// Pass a customised instance to [FeedbackSDK.show] to override any text,
/// e.g. for localisation or branding.
class FeedbackStrings {
  const FeedbackStrings({
    this.title = 'Feedback',
    this.welcomeMessage = 'Share your thoughts',
    this.typeSuggestion = 'Suggestion',
    this.typeBug = 'Bug',
    this.typeOther = 'Other',
    this.emailHint = 'Email (optional)',
    this.detailsLabel = 'Details',
    this.detailsHint = 'Describe your feedback…',
    this.submitButton = 'Send',
    this.successMessage = 'Thank you for your feedback!',
    this.errorMessage = 'Failed to send feedback. Please try again.',
  });

  final String title;
  final String welcomeMessage;
  final String typeSuggestion;
  final String typeBug;
  final String typeOther;
  final String emailHint;
  final String detailsLabel;
  final String detailsHint;
  final String submitButton;
  final String successMessage;
  final String errorMessage;
}

