/// Localizable strings for the feedback UI.
///
/// Pass a customised instance to [FeedbackSDK.show] to override any text,
/// e.g. for localisation or branding.
class FeedbackStrings {
  const FeedbackStrings({
    this.title = 'Feedback',
    this.welcomeMessage = "We'd love to hear from you!",
    this.typeSuggestion = 'Suggestion',
    this.typeBug = 'Bug Report',
    this.typeOther = 'Other',
    this.emailHint = 'Email (optional)',
    this.detailsLabel = 'Tell us more',
    this.detailsHint = 'Share your thoughts, ideas, or report an issue...',
    this.submitButton = 'Submit Feedback',
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

