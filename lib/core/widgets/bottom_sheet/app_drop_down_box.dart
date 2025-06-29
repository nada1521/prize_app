import 'package:prize/core/utils/extensions/color_extension.dart';
import 'package:prize/core/utils/extensions/text_style_extension.dart';
import 'package:prize/core/widgets/bottom_sheet/components/bottom_sheet_shape.dart';
import 'package:flutter/material.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_size.dart';

import 'components/items_bottom_sheet_list_builder.dart';

class AppDropDownBox<T> extends StatefulWidget {
  const AppDropDownBox({
    super.key,
    required this.items,
    required this.initSelection,
    required this.onItemSelected,
    required this.menuHeadline,
    this.subTitle,
    required this.selectedItemTitle,
    this.leading,
    this.onSearch,
    this.showSearch = true,
    this.onClear,
    this.centerItemTitle,
    this.itemExtent = 50,
    this.itemContainerPadding = const EdgeInsets.symmetric(
      horizontal: AppSize.paddingDefault20,
      vertical: AppSize.padding5,
    ),
    this.enabled = true,
    this.controller,
    this.backWhenSelect = true,
    this.validator,
    this.hint,
    this.labelText,
    this.prefixIcon,
    required this.isSelected,

    /// Use this custom builder to customize the builder
    /// or **Warping it with BlocProvider, etc...**.
    this.builder,
  });

  final List<T> items;
  final T? initSelection;
  final void Function(T value) onItemSelected;
  final String menuHeadline;
  final String? subTitle;
  final String Function(T value) selectedItemTitle;
  final Widget Function(T value)? leading;
  final List<T> Function(String value)? onSearch;
  final bool showSearch;
  final void Function()? onClear;
  final bool? centerItemTitle;
  final double itemExtent;
  final EdgeInsets itemContainerPadding;
  final bool backWhenSelect;

  // text field parameters
  final bool enabled;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? hint;
  final String? labelText;
  final Widget? prefixIcon;
  final bool Function(T item, T? selected) isSelected;
  final Widget Function(Widget builder)? builder;

  @override
  State<AppDropDownBox<T>> createState() => _AppDropDownBoxState<T>();
}

class _AppDropDownBoxState<T> extends State<AppDropDownBox<T>> {
  late final _controller = widget.controller ?? TextEditingController();

  @override
  Widget build(BuildContext context) {
    final String initialTextValue = widget.initSelection != null
        ? widget.selectedItemTitle(widget.initSelection as T)
        : '';
    _controller.text = initialTextValue;
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    // });

    return GestureDetector(
      onTap: widget.enabled
          ? () {
              _selectItem(context);
            }
          : null,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSize.padding16,
          vertical: AppSize.padding12,
        ),
        margin: const EdgeInsets.only(
          top: AppSize.padding16,
        ),
        decoration: BoxDecoration(
          color: widget.enabled
              ? null
              : AppColors.greyLighter.withValues(alpha: 0.60),
          borderRadius: BorderRadius.circular(AppSize.radius16),
          border: Border.all(
            color: widget.enabled ? AppColors.grey : AppColors.disabled,
            width: widget.enabled ? 1 : 1.5,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                _controller.text.isEmpty
                    ? (widget.hint ?? widget.menuHeadline)
                    : _controller.text,
                style: widget.enabled && _controller.text.isNotEmpty
                    ? context.styleBodyLarge.copyWith(
                        fontWeight: FontWeight.bold,
                      )
                    : context.styleBodyLargeLight.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
              ),
            ),
            AppSize.padding16.spaceWidth,
            const Icon(Icons.keyboard_arrow_down),
          ],
        ),
      ),
      /*child: MainTextField(
        controller: controller,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.enabled ? const Icon(Icons.keyboard_arrow_down, color: AppColor.title) : null,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSize.padding12,
          vertical: AppSize.padding12,
        ),
        hintText: widget.hintText,
        labelText: widget.labelText,
        iconSpace: false,
        filled: true,
        fillColor: widget.enabled ? Colors.transparent : AppColor.greyLighter.withValues(alpha: 0.25),
        enabled: true,
        validator: widget.validator,
      ),*/
    );
  }

  Future<void> _selectItem(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      shape: MyBottomSheetShape(),
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: context.colorWhiteOrNull,
      builder: (context) {
        final child = ItemsBottomSheetListBuilder<T>(
          items: widget.items,
          initSelection: widget.initSelection,
          onItemSelected: (item) {
            setState(() {
              widget.onItemSelected.call(item);
              _controller.text = widget.selectedItemTitle(item);
            });
          },
          isSelected: widget.isSelected,
          title: widget.menuHeadline,
          subTitle: widget.subTitle,
          selectedItemTitle: widget.selectedItemTitle,
          leading: widget.leading,
          onSearch: widget.onSearch,
          showSearch: widget.showSearch,
          centerItemTitle: widget.centerItemTitle,
          itemExtent: widget.itemExtent,
          itemPadding: widget.itemContainerPadding,
          backWhenSelect: widget.backWhenSelect,
          onClear: widget.onClear != null
              ? () {
                  setState(() {
                    _controller.clear();
                    widget.onClear?.call();
                  });
                }
              : null,
        );
        if (widget.builder != null) {
          return widget.builder!(child);
        }
        return child;
      },
    );
    if (!context.mounted) return;
    FocusScope.of(context).unfocus();
  }
}
