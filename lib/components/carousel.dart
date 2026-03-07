import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:mc_flutter_tokens/mc_tokens.dart';

/// A simple carousel component that displays items horizontally.
/// Each item takes up 35% of the viewport width (minimum 200px), showing multiple items at once.
/// Alternatively, you can specify a fixed [itemWidth] for adaptive behavior based on card width.
class McCarousel extends StatefulWidget {
  const McCarousel({
    super.key,
    required this.items,
    this.height = 200,
    this.showIndicators = true,
    this.onPageChanged,
    this.itemWidth,
    this.itemGap = 16,
  });

  /// The list of widgets to display in the carousel.
  final List<Widget> items;

  /// The height of the carousel.
  final double height;

  /// Whether to show page indicators.
  final bool showIndicators;

  /// Callback when the page changes.
  final Function(int)? onPageChanged;

  /// Optional fixed width for each item. If null, items will be 35% of viewport width (min 200px).
  /// Use this for adaptive behavior when cards have a fixed width.
  final double? itemWidth;

  /// Gap between carousel items. Defaults to 16.
  final double itemGap;

  @override
  State<McCarousel> createState() => _McCarouselState();
}

class _McCarouselState extends State<McCarousel> {
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 0;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToPage(int index) {
    final itemWidth = _calculateItemWidth();
    final offset = index * (itemWidth + widget.itemGap);

    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  double _calculateItemWidth() {
    if (widget.itemWidth != null) {
      return widget.itemWidth!;
    }
    final screenWidth = MediaQuery.of(context).size.width;
    return (screenWidth * 0.35).clamp(200.0, double.infinity);
  }

  @override
  Widget build(BuildContext context) {
    final itemWidth = _calculateItemWidth();

    return Column(
      children: [
        SizedBox(
          height: widget.height,
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is ScrollEndNotification) {
                // Calculate which page we're closest to
                final offset = _scrollController.offset;
                final newPage = (offset / (itemWidth + widget.itemGap)).round();
                if (newPage != _currentPage &&
                    newPage >= 0 &&
                    newPage < widget.items.length) {
                  setState(() {
                    _currentPage = newPage;
                  });
                  widget.onPageChanged?.call(_currentPage);
                }
              }
              return false;
            },
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
              ),
              child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 16),
                physics: const BouncingScrollPhysics(),
                itemCount: widget.items.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: itemWidth,
                    margin: EdgeInsets.only(right: widget.itemGap),
                    child: widget.items[index],
                  );
                },
              ),
            ),
          ),
        ),
        if (widget.showIndicators && widget.items.length > 1) ...[
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.items.length,
              (index) => GestureDetector(
                onTap: () => _scrollToPage(index),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: index == _currentPage ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      context.spacingTokens.cornerSmall,
                    ),
                    color:
                        index == _currentPage
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(
                              context,
                            ).colorScheme.onSurface.withOpacity(0.3),
                  ),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
