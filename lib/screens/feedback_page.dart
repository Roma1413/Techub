import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/feedback.dart';
import '../models/user.dart';
import '../services/feedback_service.dart';

class FeedbackPage extends StatefulWidget {
  final User user;

  const FeedbackPage({super.key, required this.user});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  static const _categories = [
    'General',
    'Bug report',
    'Feature request',
    'Shopping experience',
  ];

  final _feedbackService = FeedbackService();
  final _messageController = TextEditingController();

  String _category = _categories.first;
  double _rating = 4;
  bool _submitting = false;
  late Future<List<AppFeedback>> _historyFuture;

  @override
  void initState() {
    super.initState();
    _reloadHistory();
  }

  void _reloadHistory() {
    _historyFuture = widget.user.id.isEmpty
        ? Future.value([])
        : _feedbackService.fetchUserFeedback(widget.user.id);
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final message = _messageController.text.trim();
    if (message.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your feedback')),
      );
      return;
    }

    setState(() => _submitting = true);

    try {
      await _feedbackService.submit(
        AppFeedback(
          id: '',
          userId: widget.user.id,
          userName: widget.user.username,
          email: widget.user.email,
          category: _category,
          message: message,
          rating: _rating,
          createdAt: DateTime.now(),
        ),
      );

      _messageController.clear();
      if (!mounted) return;
      setState(() {
        _submitting = false;
        _rating = 4;
        _category = _categories.first;
        _reloadHistory();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Thanks! Your feedback was saved.')),
      );
    } catch (_) {
      if (!mounted) return;
      setState(() => _submitting = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not send feedback. Try again later.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TechColors.background,
      appBar: AppBar(
        backgroundColor: TechColors.background,
        iconTheme: const IconThemeData(color: TechColors.textPrimary),
        title: const Text(
          'Send Feedback',
          style: TextStyle(
            color: TechColors.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildFormCard(),
          const SizedBox(height: 20),
          const Text(
            'Your past feedback',
            style: TextStyle(
              color: TechColors.textMuted,
              fontSize: 11,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 8),
          _buildHistory(),
        ],
      ),
    );
  }

  Widget _buildFormCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: TechColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: TechColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'We read every message',
            style: TextStyle(
              color: TechColors.textPrimary,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Stored securely in Firebase so our team can follow up.',
            style: TextStyle(
              color: TechColors.textSecondary,
              fontSize: 12,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Category',
            style: TextStyle(
              color: TechColors.textMuted,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          DropdownButtonFormField<String>(
            value: _category,
            dropdownColor: TechColors.surfaceHigh,
            style: const TextStyle(color: TechColors.textPrimary, fontSize: 14),
            decoration: _inputDecoration(),
            items: _categories
                .map(
                  (c) => DropdownMenuItem(
                    value: c,
                    child: Text(c),
                  ),
                )
                .toList(),
            onChanged: _submitting
                ? null
                : (v) {
                    if (v != null) setState(() => _category = v);
                  },
          ),
          const SizedBox(height: 14),
          const Text(
            'Overall rating',
            style: TextStyle(
              color: TechColors.textMuted,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            children: List.generate(5, (i) {
              final star = i + 1;
              return GestureDetector(
                onTap: _submitting
                    ? null
                    : () => setState(() => _rating = star.toDouble()),
                child: Icon(
                  star <= _rating
                      ? Icons.star_rounded
                      : Icons.star_outline_rounded,
                  color: TechColors.warning,
                  size: 32,
                ),
              );
            }),
          ),
          const SizedBox(height: 14),
          const Text(
            'Message',
            style: TextStyle(
              color: TechColors.textMuted,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          TextField(
            controller: _messageController,
            maxLines: 4,
            enabled: !_submitting,
            style: const TextStyle(color: TechColors.textPrimary, fontSize: 14),
            decoration: _inputDecoration(hint: 'Tell us what you think...'),
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _submitting ? null : _submit,
              style: ElevatedButton.styleFrom(
                backgroundColor: TechColors.accent,
                foregroundColor: TechColors.background,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: _submitting
                  ? const SizedBox(
                      height: 18,
                      width: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: TechColors.background,
                      ),
                    )
                  : const Text(
                      'Submit Feedback',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _inputDecoration({String? hint}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: TechColors.textMuted),
      filled: true,
      fillColor: TechColors.surfaceHigh,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: TechColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: TechColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: TechColors.accent, width: 1.5),
      ),
    );
  }

  Widget _buildHistory() {
    if (widget.user.id.isEmpty) {
      return const Text(
        'Sign in to see your feedback history.',
        style: TextStyle(color: TechColors.textSecondary, fontSize: 13),
      );
    }

    return FutureBuilder<List<AppFeedback>>(
      future: _historyFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: CircularProgressIndicator(color: TechColors.accent),
            ),
          );
        }

        if (snapshot.hasError) {
          return Text(
            'Could not load history: ${snapshot.error}',
            style: const TextStyle(
              color: TechColors.textSecondary,
              fontSize: 12,
            ),
          );
        }

        final items = snapshot.data ?? [];
        if (items.isEmpty) {
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: TechColors.surface,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: TechColors.border),
            ),
            child: const Column(
              children: [
                Icon(Icons.chat_bubble_outline,
                    color: TechColors.textMuted, size: 40),
                SizedBox(height: 10),
                Text(
                  'No feedback yet',
                  style: TextStyle(
                    color: TechColors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          );
        }

        return Column(
          children: items
              .map(
                (f) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: _buildHistoryCard(f),
                ),
              )
              .toList(),
        );
      },
    );
  }

  Widget _buildHistoryCard(AppFeedback feedback) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: TechColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: TechColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                feedback.category,
                style: const TextStyle(
                  color: TechColors.accent,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              Text(
                '${feedback.createdAt.day}/${feedback.createdAt.month}/${feedback.createdAt.year}',
                style: const TextStyle(
                  color: TechColors.textMuted,
                  fontSize: 11,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: List.generate(5, (i) {
              return Icon(
                i < feedback.rating.round()
                    ? Icons.star_rounded
                    : Icons.star_outline_rounded,
                color: TechColors.warning,
                size: 14,
              );
            }),
          ),
          const SizedBox(height: 8),
          Text(
            feedback.message,
            style: const TextStyle(
              color: TechColors.textSecondary,
              fontSize: 13,
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }
}
