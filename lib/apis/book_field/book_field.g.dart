// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_field.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$bookFieldHash() => r'451e00c10c7fe32700e90bea21fa104924046edc';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [bookField].
@ProviderFor(bookField)
const bookFieldProvider = BookFieldFamily();

/// See also [bookField].
class BookFieldFamily extends Family<AsyncValue<void>> {
  /// See also [bookField].
  const BookFieldFamily();

  /// See also [bookField].
  BookFieldProvider call(
    BookFieldData data,
  ) {
    return BookFieldProvider(
      data,
    );
  }

  @override
  BookFieldProvider getProviderOverride(
    covariant BookFieldProvider provider,
  ) {
    return call(
      provider.data,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'bookFieldProvider';
}

/// See also [bookField].
class BookFieldProvider extends AutoDisposeFutureProvider<void> {
  /// See also [bookField].
  BookFieldProvider(
    BookFieldData data,
  ) : this._internal(
          (ref) => bookField(
            ref as BookFieldRef,
            data,
          ),
          from: bookFieldProvider,
          name: r'bookFieldProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$bookFieldHash,
          dependencies: BookFieldFamily._dependencies,
          allTransitiveDependencies: BookFieldFamily._allTransitiveDependencies,
          data: data,
        );

  BookFieldProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.data,
  }) : super.internal();

  final BookFieldData data;

  @override
  Override overrideWith(
    FutureOr<void> Function(BookFieldRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: BookFieldProvider._internal(
        (ref) => create(ref as BookFieldRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        data: data,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _BookFieldProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BookFieldProvider && other.data == data;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, data.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BookFieldRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `data` of this provider.
  BookFieldData get data;
}

class _BookFieldProviderElement extends AutoDisposeFutureProviderElement<void>
    with BookFieldRef {
  _BookFieldProviderElement(super.provider);

  @override
  BookFieldData get data => (origin as BookFieldProvider).data;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
