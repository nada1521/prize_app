// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'adding_product_to_wishlist_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddingProductToWishlistState {
  List<ProductModel> get selectedProducts;

  /// Create a copy of AddingProductToWishlistState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddingProductToWishlistStateCopyWith<AddingProductToWishlistState>
      get copyWith => _$AddingProductToWishlistStateCopyWithImpl<
              AddingProductToWishlistState>(
          this as AddingProductToWishlistState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddingProductToWishlistState &&
            const DeepCollectionEquality()
                .equals(other.selectedProducts, selectedProducts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(selectedProducts));

  @override
  String toString() {
    return 'AddingProductToWishlistState(selectedProducts: $selectedProducts)';
  }
}

/// @nodoc
abstract mixin class $AddingProductToWishlistStateCopyWith<$Res> {
  factory $AddingProductToWishlistStateCopyWith(
          AddingProductToWishlistState value,
          $Res Function(AddingProductToWishlistState) _then) =
      _$AddingProductToWishlistStateCopyWithImpl;
  @useResult
  $Res call({List<ProductModel> selectedProducts});
}

/// @nodoc
class _$AddingProductToWishlistStateCopyWithImpl<$Res>
    implements $AddingProductToWishlistStateCopyWith<$Res> {
  _$AddingProductToWishlistStateCopyWithImpl(this._self, this._then);

  final AddingProductToWishlistState _self;
  final $Res Function(AddingProductToWishlistState) _then;

  /// Create a copy of AddingProductToWishlistState
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

/// Adds pattern-matching-related methods to [AddingProductToWishlistState].
extension AddingProductToWishlistStatePatterns on AddingProductToWishlistState {
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
    TResult Function(_AddingProductToWishlistState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AddingProductToWishlistState() when $default != null:
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
    TResult Function(_AddingProductToWishlistState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddingProductToWishlistState():
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
    TResult? Function(_AddingProductToWishlistState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddingProductToWishlistState() when $default != null:
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
      case _AddingProductToWishlistState() when $default != null:
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
      case _AddingProductToWishlistState():
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
      case _AddingProductToWishlistState() when $default != null:
        return $default(_that.selectedProducts);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AddingProductToWishlistState implements AddingProductToWishlistState {
  const _AddingProductToWishlistState(
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

  /// Create a copy of AddingProductToWishlistState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AddingProductToWishlistStateCopyWith<_AddingProductToWishlistState>
      get copyWith => __$AddingProductToWishlistStateCopyWithImpl<
          _AddingProductToWishlistState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddingProductToWishlistState &&
            const DeepCollectionEquality()
                .equals(other._selectedProducts, _selectedProducts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_selectedProducts));

  @override
  String toString() {
    return 'AddingProductToWishlistState(selectedProducts: $selectedProducts)';
  }
}

/// @nodoc
abstract mixin class _$AddingProductToWishlistStateCopyWith<$Res>
    implements $AddingProductToWishlistStateCopyWith<$Res> {
  factory _$AddingProductToWishlistStateCopyWith(
          _AddingProductToWishlistState value,
          $Res Function(_AddingProductToWishlistState) _then) =
      __$AddingProductToWishlistStateCopyWithImpl;
  @override
  @useResult
  $Res call({List<ProductModel> selectedProducts});
}

/// @nodoc
class __$AddingProductToWishlistStateCopyWithImpl<$Res>
    implements _$AddingProductToWishlistStateCopyWith<$Res> {
  __$AddingProductToWishlistStateCopyWithImpl(this._self, this._then);

  final _AddingProductToWishlistState _self;
  final $Res Function(_AddingProductToWishlistState) _then;

  /// Create a copy of AddingProductToWishlistState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? selectedProducts = null,
  }) {
    return _then(_AddingProductToWishlistState(
      selectedProducts: null == selectedProducts
          ? _self._selectedProducts
          : selectedProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
    ));
  }
}

// dart format on
