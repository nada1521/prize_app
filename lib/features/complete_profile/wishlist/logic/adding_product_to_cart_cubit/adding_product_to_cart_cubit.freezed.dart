// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'adding_product_to_cart_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddingProductToCartState {
  List<ProductModel> get selectedProducts;

  /// Create a copy of AddingProductToCartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddingProductToCartStateCopyWith<AddingProductToCartState> get copyWith =>
      _$AddingProductToCartStateCopyWithImpl<AddingProductToCartState>(
          this as AddingProductToCartState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddingProductToCartState &&
            const DeepCollectionEquality()
                .equals(other.selectedProducts, selectedProducts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(selectedProducts));

  @override
  String toString() {
    return 'AddingProductToCartState(selectedProducts: $selectedProducts)';
  }
}

/// @nodoc
abstract mixin class $AddingProductToCartStateCopyWith<$Res> {
  factory $AddingProductToCartStateCopyWith(AddingProductToCartState value,
          $Res Function(AddingProductToCartState) _then) =
      _$AddingProductToCartStateCopyWithImpl;
  @useResult
  $Res call({List<ProductModel> selectedProducts});
}

/// @nodoc
class _$AddingProductToCartStateCopyWithImpl<$Res>
    implements $AddingProductToCartStateCopyWith<$Res> {
  _$AddingProductToCartStateCopyWithImpl(this._self, this._then);

  final AddingProductToCartState _self;
  final $Res Function(AddingProductToCartState) _then;

  /// Create a copy of AddingProductToCartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedProducts = null,
  }) {
    return _then(_self.copyWith(
      selectedProducts: null == selectedProducts
          ? _self.selectedProducts
          : selectedProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
    ));
  }
}

/// Adds pattern-matching-related methods to [AddingProductToCartState].
extension AddingProductToCartStatePatterns on AddingProductToCartState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AddingProductToCartState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AddingProductToCartState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AddingProductToCartState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddingProductToCartState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AddingProductToCartState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddingProductToCartState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<ProductModel> selectedProducts)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AddingProductToCartState() when $default != null:
        return $default(_that.selectedProducts);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<ProductModel> selectedProducts) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddingProductToCartState():
        return $default(_that.selectedProducts);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<ProductModel> selectedProducts)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddingProductToCartState() when $default != null:
        return $default(_that.selectedProducts);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AddingProductToCartState implements AddingProductToCartState {
  const _AddingProductToCartState(
      {required final List<ProductModel> selectedProducts})
      : _selectedProducts = selectedProducts;

  final List<ProductModel> _selectedProducts;
  @override
  List<ProductModel> get selectedProducts {
    if (_selectedProducts is EqualUnmodifiableListView)
      return _selectedProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedProducts);
  }

  /// Create a copy of AddingProductToCartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AddingProductToCartStateCopyWith<_AddingProductToCartState> get copyWith =>
      __$AddingProductToCartStateCopyWithImpl<_AddingProductToCartState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddingProductToCartState &&
            const DeepCollectionEquality()
                .equals(other._selectedProducts, _selectedProducts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_selectedProducts));

  @override
  String toString() {
    return 'AddingProductToCartState(selectedProducts: $selectedProducts)';
  }
}

/// @nodoc
abstract mixin class _$AddingProductToCartStateCopyWith<$Res>
    implements $AddingProductToCartStateCopyWith<$Res> {
  factory _$AddingProductToCartStateCopyWith(_AddingProductToCartState value,
          $Res Function(_AddingProductToCartState) _then) =
      __$AddingProductToCartStateCopyWithImpl;
  @override
  @useResult
  $Res call({List<ProductModel> selectedProducts});
}

/// @nodoc
class __$AddingProductToCartStateCopyWithImpl<$Res>
    implements _$AddingProductToCartStateCopyWith<$Res> {
  __$AddingProductToCartStateCopyWithImpl(this._self, this._then);

  final _AddingProductToCartState _self;
  final $Res Function(_AddingProductToCartState) _then;

  /// Create a copy of AddingProductToCartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? selectedProducts = null,
  }) {
    return _then(_AddingProductToCartState(
      selectedProducts: null == selectedProducts
          ? _self._selectedProducts
          : selectedProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
    ));
  }
}

// dart format on
