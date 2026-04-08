import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/suggestions_repository.dart';
import '../l10n/generated/feedback_localizations.dart';
import 'feedback_animation.dart';
import 'feedback_cubit.dart';

/// The feedback screen widget.
///
/// Prefer using [FeedbackSDK.show] — it wraps this widget with the
/// necessary [Localizations] delegate automatically.
class FeedbackPage extends StatefulWidget {
  const FeedbackPage({
    super.key,
    required this.repository,
    this.animationColor,
  });

  final SuggestionsRepository repository;

  /// Optional tint color for the feedback animation.
  ///
  /// Defaults to [ColorScheme.primary] when null.
  final Color? animationColor;

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  late String _selectedType;
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  // Initialise _selectedType lazily on first build so we have a context.
  bool _initialised = false;

  @override
  void dispose() {
    _controller.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _showSnackBar(BuildContext context, String message, {bool isError = false}) {
    final cs = Theme.of(context).colorScheme;
    final bg = isError ? cs.errorContainer : cs.primaryContainer;
    final fg = isError ? cs.onErrorContainer : cs.onPrimaryContainer;
    final icon = isError ? Icons.error : Icons.check_circle;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: fg, size: 20),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: TextStyle(color: fg, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
        backgroundColor: bg,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = FeedbackLocalizations.of(context);

    // Set selectedType once we have l10n available.
    if (!_initialised) {
      _selectedType = l10n.feedbackTypeSuggestion;
      _controller.addListener(() { if (mounted) setState(() {}); });
      _initialised = true;
    }

    return BlocProvider<FeedbackCubit>(
      create: (_) => FeedbackCubit(repository: widget.repository),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(l10n.feedbackTitle),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocConsumer<FeedbackCubit, FeedbackState>(
            listener: (context, state) {
              if (state.status == FeedbackStatus.success) {
                _showSnackBar(context, l10n.feedbackSuccess);
                _controller.clear();
                _emailController.clear();
                setState(() {
                  _selectedType = l10n.feedbackTypeSuggestion;
                });
                Navigator.of(context).pop();
              } else if (state.status == FeedbackStatus.error) {
                _showSnackBar(
                  context,
                  state.errorMessage ?? l10n.feedbackError,
                  isError: true,
                );
              }
            },
            builder: (context, state) {
              final isSubmitting = state.status == FeedbackStatus.submitting;
              final colorScheme = Theme.of(context).colorScheme;

              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Hero animation
                      Center(
                        child: SizedBox(
                          height: 220,
                          width: double.infinity,
                          child: Stack(
                            clipBehavior: Clip.hardEdge,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: ExcludeSemantics(
                                  child: FeedbackAnimation(
                                    color: widget.animationColor,
                                    size: 180,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: colorScheme.surface
                                        .withAlpha((0.9 * 255).round()),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black
                                            .withAlpha((0.12 * 255).round()),
                                        blurRadius: 6,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    l10n.feedbackWelcome,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: colorScheme.onSurface,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 8),

                      // Feedback type chips
                      Wrap(
                        spacing: 8,
                        runSpacing: 0,
                        children: [
                          for (final type in [
                            l10n.feedbackTypeSuggestion,
                            l10n.feedbackTypeBug,
                            l10n.feedbackTypeOther,
                          ])
                            ChoiceChip(
                              label: Text(type),
                              selected: _selectedType == type,
                              onSelected: isSubmitting
                                  ? null
                                  : (v) {
                                      if (v) setState(() => _selectedType = type);
                                    },
                              selectedColor: colorScheme.primary,
                              backgroundColor: colorScheme.surface,
                              labelStyle: TextStyle(
                                color: _selectedType == type
                                    ? colorScheme.onPrimary
                                    : colorScheme.onSurface,
                              ),
                              elevation: 1,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 4),
                            ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Optional email
                      TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: l10n.feedbackEmailHint,
                          prefixIcon: const Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                        ),
                      ),

                      const SizedBox(height: 12),

                      Text(l10n.feedbackDetailsLabel,
                          style: const TextStyle(fontWeight: FontWeight.w500)),
                      const SizedBox(height: 8),

                      TextField(
                        controller: _controller,
                        maxLines: 6,
                        decoration: InputDecoration(
                          hintText: l10n.feedbackDetailsHint,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                        ),
                      ),

                      const SizedBox(height: 16),

                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: isSubmitting ||
                                  _controller.text.trim().isEmpty
                              ? null
                              : () async {
                                  final cubit = context.read<FeedbackCubit>();
                                  await cubit.sendSuggestion(
                                    type: _selectedType,
                                    text: _controller.text.trim(),
                                    email: _emailController.text.trim().isNotEmpty
                                        ? _emailController.text.trim()
                                        : null,
                                  );
                                },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colorScheme.primary,
                            foregroundColor: colorScheme.onPrimary,
                            disabledBackgroundColor: colorScheme.primary
                                .withAlpha((0.48 * 255).round()),
                            disabledForegroundColor: colorScheme.onPrimary
                                .withAlpha((0.72 * 255).round()),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 2,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                          ),
                          child: isSubmitting
                              ? SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        colorScheme.onPrimary),
                                  ),
                                )
                              : Text(
                                  l10n.feedbackSubmit,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: colorScheme.onPrimary,
                                      ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

