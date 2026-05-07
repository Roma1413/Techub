import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/models.dart';
import '../components/product_item.dart';

class BookmarksPage extends StatefulWidget {
  final BookmarkManager bookmarkManager;

  const BookmarksPage({super.key, required this.bookmarkManager});

  @override
  State<BookmarksPage> createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  @override
  Widget build(BuildContext context) {
    final bookmarks = widget.bookmarkManager.bookmarks;

    return Scaffold(
      backgroundColor: TechColors.background,
      appBar: AppBar(
        backgroundColor: TechColors.background,
        title: const Text(
          'My Bookmarks',
          style: TextStyle(
            color: TechColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        iconTheme: const IconThemeData(color: TechColors.textPrimary),
      ),
      body: bookmarks.isEmpty
          ? _buildEmpty()
          : ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: bookmarks.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final product = bookmarks[index];

          return Dismissible(
            key: ValueKey(product.id),
            direction: DismissDirection.endToStart,

            // Red delete background when swiping left
            background: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Icon(
                Icons.delete,
                color: Colors.white,
                size: 28,
              ),
            ),

            // Delete item
            onDismissed: (_) async {
              await widget.bookmarkManager.toggle(product);
              setState(() {});

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${product.name} removed'),
                  duration: const Duration(seconds: 2),
                ),
              );
            },

            child: ProductItem(
              product: product,
              bookmarkManager: widget.bookmarkManager,
            ),
          );
        },
      ),
    );
  }

  Widget _buildEmpty() {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.bookmark_border,
            color: TechColors.textMuted,
            size: 64,
          ),
          SizedBox(height: 16),
          Text(
            'No bookmarks yet',
            style: TextStyle(
              color: TechColors.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Tap the bookmark icon on any product\nto save it here.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: TechColors.textSecondary,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}