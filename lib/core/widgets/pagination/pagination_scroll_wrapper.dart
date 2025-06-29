import 'package:flutter/material.dart';
import 'package:prize/core/widgets/main/app_circular_progress.dart';

/// A scrollable container that triggers `onPagination` when the user scrolls near the end.
///
/// Wrap any scrollable child to automatically call back for loading more items
/// when within `maxScrollMargin` pixels from the bottom. Shows optional `loadingIndicator`.
class PaginationScrollWrapper extends StatefulWidget {
  const PaginationScrollWrapper({
    super.key,
    /// Called when the user scrolls to the end of the list.
    required this.onPagination,
    /// Whether to show the loading indicator & disable pagination when [loading] is true.
    required this.loading,
    /// The max scroll margin to trigger pagination.
    this.maxScrollMargin = 100,
    /// The child widget.
    required this.child,
    /// Custom loading indicator to show when [loading] is true.
    this.loadingIndicator,
  });

  final VoidCallback onPagination;
  final double maxScrollMargin;
  final Widget child;
  final Widget? loadingIndicator;
  final bool loading;

  @override
  State<PaginationScrollWrapper> createState() => _PaginationScrollWrapperState();
}

class _PaginationScrollWrapperState extends State<PaginationScrollWrapper> {
  double _currentMaxScrollExtent = 0;

  // You have a currentPage option
  bool _onNotification(ScrollNotification notification) {
    final position = notification.metrics.pixels;
    final maxScroll = notification.metrics.maxScrollExtent;
    final reachedEnd = position >= maxScroll;
    // final reachedEnd = notification.metrics.extentAfter < widget.maxScrollMargin;
    final fetchNext = reachedEnd && !widget.loading && _currentMaxScrollExtent <= maxScroll;

    // debugPrint('> fetchNext: $fetchNext');
    // debugPrint('> reachedEnd: $reachedEnd');
    // debugPrint('> position: ${notification.metrics.pixels}');
    // debugPrint('> extentAfter: ${notification.metrics.extentAfter}');
    // debugPrint('> maxScroll: $maxScroll');
    // debugPrint('> currentMaxScrollExtent: $_currentMaxScrollExtent');
    // debugPrint('--------------');

    if (fetchNext) {
      debugPrint('> Pagination reached end');
      _currentMaxScrollExtent = maxScroll;
      widget.onPagination();
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: NotificationListener<ScrollNotification>(
            onNotification: _onNotification,
            child: widget.child,
          ),
        ),
        if (widget.loading)
          SafeArea(
            child: Container(
              alignment: Alignment.center,
              child: widget.loadingIndicator ?? const AppCircularProgress(),
            ),
          ),
      ],
    );
  }
}
