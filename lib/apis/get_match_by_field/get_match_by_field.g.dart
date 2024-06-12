// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_match_by_field.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getMatchByFieldHash() => r'95686ea8c1fac5878724c7c1df82146089571cb9';

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

/// See also [getMatchByField].
@ProviderFor(getMatchByField)
const getMatchByFieldProvider = GetMatchByFieldFamily();

/// See also [getMatchByField].
class GetMatchByFieldFamily extends Family<AsyncValue<List<Match>?>> {
  /// See also [getMatchByField].
  const GetMatchByFieldFamily();

  /// See also [getMatchByField].
  GetMatchByFieldProvider call(
    GetMatchByFieldParam params,
  ) {
    return GetMatchByFieldProvider(
      params,
    );
  }

  @override
  GetMatchByFieldProvider getProviderOverride(
    covariant GetMatchByFieldProvider provider,
  ) {
    return call(
      provider.params,
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
  String? get name => r'getMatchByFieldProvider';
}

/// See also [getMatchByField].
class GetMatchByFieldProvider extends AutoDisposeFutureProvider<List<Match>?> {
  /// See also [getMatchByField].
  GetMatchByFieldProvider(
    GetMatchByFieldParam params,
  ) : this._internal(
          (ref) => getMatchByField(
            ref as GetMatchByFieldRef,
            params,
          ),
          from: getMatchByFieldProvider,
          name: r'getMatchByFieldProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getMatchByFieldHash,
          dependencies: GetMatchByFieldFamily._dependencies,
          allTransitiveDependencies:
              GetMatchByFieldFamily._allTransitiveDependencies,
          params: params,
        );

  GetMatchByFieldProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.params,
  }) : super.internal();

  final GetMatchByFieldParam params;

  @override
  Override overrideWith(
    FutureOr<List<Match>?> Function(GetMatchByFieldRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetMatchByFieldProvider._internal(
        (ref) => create(ref as GetMatchByFieldRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        params: params,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Match>?> createElement() {
    return _GetMatchByFieldProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetMatchByFieldProvider && other.params == params;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, params.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetMatchByFieldRef on AutoDisposeFutureProviderRef<List<Match>?> {
  /// The parameter `params` of this provider.
  GetMatchByFieldParam get params;
}

class _GetMatchByFieldProviderElement
    extends AutoDisposeFutureProviderElement<List<Match>?>
    with GetMatchByFieldRef {
  _GetMatchByFieldProviderElement(super.provider);

  @override
  GetMatchByFieldParam get params => (origin as GetMatchByFieldProvider).params;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
