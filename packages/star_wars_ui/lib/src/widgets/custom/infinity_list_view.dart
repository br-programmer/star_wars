import 'package:flutter/material.dart';
import 'package:star_wars_ui/star_wars_ui.dart';

class InfiniteListView<T> extends StatefulWidget {
  const InfiniteListView({
    Key? key,
    required this.items,
    required this.itemBuilder,
    this.onLoadMore,
    this.hasReachedMax = true,
    this.scrollDirection = Axis.vertical,
    this.loadingMoreData = false,
    this.padding = edgeInsetsZero,
    this.emptyView,
    this.onRefresh,
    this.separatorBuilder,
  }) : super(key: key);

  final void Function()? onLoadMore;
  final List<T> items;
  final Widget Function(BuildContext, T) itemBuilder;
  final bool hasReachedMax;
  final Axis scrollDirection;
  final bool loadingMoreData;
  final Widget? emptyView;
  final Future<void> Function()? onRefresh;
  final Widget Function(BuildContext, int)? separatorBuilder;
  final EdgeInsetsGeometry padding;

  @override
  State<InfiniteListView<T>> createState() => _InfiniteListViewState();
}

class _InfiniteListViewState<T> extends State<InfiniteListView<T>> {
  late final scrollController = ScrollController()..addListener(onScroll);
  late bool hasReachedMax = widget.hasReachedMax;
  late bool loadingMoreData = widget.loadingMoreData;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    scrollController
      ..removeListener(onScroll)
      ..dispose();
    super.dispose();
  }

  void onScroll() {
    final offset = scrollController.offset + 60;
    final maxScrollExtent = scrollController.position.maxScrollExtent;
    if (offset >= maxScrollExtent && !loadingMoreData && hasReachedMax) {
      widget.onLoadMore?.call();
    }
  }

  @override
  void didUpdateWidget(InfiniteListView<T> oldWidget) {
    if (oldWidget != widget) {
      hasReachedMax = widget.hasReachedMax;
      loadingMoreData = widget.loadingMoreData;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final items = widget.items;
    final emptyView = widget.emptyView ?? const SizedBox.shrink();
    const physics = AlwaysScrollableScrollPhysics(
      parent: BouncingScrollPhysics(),
    );
    late final Widget child;
    if (items.isEmpty) {
      child = CustomScrollView(
        physics: physics,
        slivers: [SliverFillRemaining(hasScrollBody: false, child: emptyView)],
      );
    } else {
      child = ListView.separated(
        controller: scrollController,
        physics: physics,
        scrollDirection: widget.scrollDirection,
        padding: widget.padding,
        itemCount: items.length + 1,
        itemBuilder: (context, index) {
          if (index == items.length) {
            return loadingMoreData
                ? const LoadMoreIndicator()
                : const SizedBox.shrink();
          }
          return widget.itemBuilder(context, items[index]);
        },
        separatorBuilder: widget.separatorBuilder ?? (_, __) => gap4,
      );
    }
    if (widget.onRefresh != null) {
      return RefreshIndicator(
        color: Palette.primary,
        backgroundColor: Palette.transparent,
        onRefresh: widget.onRefresh!,
        child: child,
      );
    }
    return child;
  }
}

class LoadMoreIndicator extends StatelessWidget {
  const LoadMoreIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: edgeInsets12,
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Palette.primary),
        ),
      ),
    );
  }
}
