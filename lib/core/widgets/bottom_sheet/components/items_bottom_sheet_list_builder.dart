import 'package:prize/core/utils/extensions/context_extension.dart';
import 'package:prize/core/utils/extensions/text_style_extension.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_size.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'app_bottom_sheet_drag_widget.dart';

class ItemsBottomSheetListBuilder<T> extends StatefulWidget {
  const ItemsBottomSheetListBuilder({
    super.key,
    required this.items,
    required this.onItemSelected,
    this.initSelection,
    required this.title,
    this.subTitle,
    this.onSearch,
    this.showSearch = true,
    required this.isSelected,

    /// set how does you want to show your item text,
    ///
    /// i.e: when select [WorkTime] show `"${e.from} - ${e.to}"`.
    required this.selectedItemTitle,
    this.centerItemTitle,
    this.leading,
    this.itemExtent = 50,
    this.itemPadding = const EdgeInsets.symmetric(
      horizontal: AppSize.paddingDefault20,
      vertical: AppSize.padding16,
    ),
    this.onClear,
    this.backWhenSelect = true,
  });

  final List<T> items;
  final T? initSelection;
  final void Function(T value) onItemSelected;
  final String title;
  final String? subTitle;
  final String Function(T value) selectedItemTitle;
  final Widget Function(T value)? leading;
  final List<T> Function(String value)? onSearch;
  final bool showSearch;
  final bool Function(T item, T? selected) isSelected;
  final void Function()? onClear;
  final bool? centerItemTitle;
  final double itemExtent;
  final EdgeInsets itemPadding;
  final bool backWhenSelect;

  @override
  State<ItemsBottomSheetListBuilder<T>> createState() =>
      _ItemsBottomSheetListBuilderState<T>();
}

class _ItemsBottomSheetListBuilderState<T>
    extends State<ItemsBottomSheetListBuilder<T>> {
  late T? _selected = widget.initSelection;
  late ScrollController _scrollController;
  late final double _itemExtent = widget.itemExtent;
  late List<T> items = widget.items;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToSelectedItem();
    });
  }

  void _scrollToSelectedItem() {
    final selectedIndex =
        _selected != null ? items.indexOf(_selected as T) : -1;
    if (selectedIndex == -1) return;
    final index = selectedIndex != -1 ? selectedIndex : 2.5;
    final offset = index * _itemExtent;
    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.mediaQuery.viewInsets.bottom == 0
          ? context.querySize.height * 0.55
          : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AppBottomSheetDragWidget(),
            Text(
              widget.title,
              style: context.styleHeadline1,
            ),
            if (widget.subTitle != null)
              Text(
                widget.subTitle!,
              ),
            const SizedBox(height: AppSize.padding12),
            // search
            if (widget.showSearch) ...[
              TextFormField(
                maxLines: 1,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.search,
                onChanged: _onSearch,
                decoration: InputDecoration(
                  hintText: LocaleKeys.search_search_here.tr(),
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
              const SizedBox(height: AppSize.paddingDefault20),
            ],

            // content
            items.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      controller: _scrollController,
                      itemExtent: _itemExtent,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        // final isSelected = item == _selected;
                        final isSelected = widget.isSelected(item, _selected);
                        return GestureDetector(
                          onTap: () async {
                            setState(() {
                              _selected = item;
                              _scrollToSelectedItem();
                              widget.onItemSelected(item);
                            });

                            if (widget.backWhenSelect) {
                              await Future.delayed(
                                  const Duration(milliseconds: 300));
                              if (!context.mounted) return;
                              Navigator.pop(context);
                              FocusScope.of(context).unfocus();
                            }
                          },
                          child: Container(
                            width: double.maxFinite,
                            height: double.maxFinite,
                            padding: widget.itemPadding,
                            alignment: Alignment.center,
                            decoration: ShapeDecoration(
                              color: isSelected
                                  ? AppColors.primary.withValues(alpha: 0.06)
                                  : null,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      AppSize.radiusLarge14)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                if (widget.leading != null) ...[
                                  widget.leading!(item),
                                  const SizedBox(width: AppSize.padding12),
                                ],
                                Expanded(
                                  child: Text(
                                    widget.selectedItemTitle(item),
                                    style: context.styleHeadline2.copyWith(
                                      fontSize: isSelected ? 16 + 1 : 16 - 1,
                                      color: isSelected
                                          ? AppColors.titleBody
                                          : AppColors.titleBodyLight,
                                    ),
                                    textAlign: widget.centerItemTitle == true
                                        ? TextAlign.center
                                        : widget.centerItemTitle == false
                                            ? TextAlign.start
                                            : widget.leading != null
                                                ? TextAlign.start
                                                : TextAlign.center,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : Expanded(
                    child: Center(
                      child: Text(LocaleKeys.common_no_items.tr()),
                    ),
                  ),
            // cancel
            if (widget.onClear != null)
              Padding(
                padding: const EdgeInsets.only(
                  top: AppSize.padding12,
                  bottom: AppSize.padding16,
                ),
                child: GestureDetector(
                  onTap: () {
                    widget.onClear!.call();
                    Navigator.pop(context);
                  },
                  child: Text(
                    LocaleKeys.action_clear.tr(),
                    style: context.styleBodyLarge.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
            const SizedBox(height: AppSize.padding16),
          ],
        ),
      ),
    );
  }

  void _onSearch(String value) {
    if (value.isNotEmpty) {
      setState(() {
        if (widget.onSearch != null) {
          items = widget.onSearch?.call(value.toLowerCase()) ?? <T>[];
        } else {
          items = widget.items
              .where((element) => widget
                  .selectedItemTitle(element)
                  .toLowerCase()
                  .contains(value))
              .toList();
        }
      });
    } else {
      setState(() {
        items = widget.items;
      });
    }
  }
}
