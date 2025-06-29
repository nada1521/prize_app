import 'package:flutter/material.dart';

class CustomRadioOption<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T?> onChanged;

  final double size;

  const CustomRadioOption({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.size = 22,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;

    return InkWell(
      onTap: () => onChanged(value),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected
                ? Theme.of(context).colorScheme.onPrimary
                : Theme.of(context).colorScheme.outline,
            width: 1,
          ),
        ),
        child: isSelected
            ? Center(
                child: Container(
                  width: size / 2,
                  height: size / 2,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
