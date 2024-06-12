// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_sport_field.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getSportFieldHash() => r'df961b0246af716df2314f4cdc6874686af53aea';

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

/// See also [getSportField].
@ProviderFor(getSportField)
const getSportFieldProvider = GetSportFieldFamily();

/// See also [getSportField].
class GetSportFieldFamily extends Family<AsyncValue<List<SportField>?>> {
  /// See also [getSportField].
  const GetSportFieldFamily();

  /// See also [getSportField].
  GetSportFieldProvider call(
    String? sport,
  ) {
    return GetSportFieldProvider(
      sport,
    );
  }

  @override
  GetSportFieldProvider getProviderOverride(
    covariant GetSportFieldProvider provider,
  ) {
    return call(
      provider.sport,
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
  String? get name => r'getSportFieldProvider';
}

/// See also [getSportField].
class GetSportFieldProvider
    extends AutoDisposeFutureProvider<List<SportField>?> {
  /// See also [getSportField].
  GetSportFieldProvider(
    String? sport,
  ) : this._internal(
          (ref) => getSportField(
            ref as GetSportFieldRef,
            sport,
          ),
          from: getSportFieldProvider,
          name: r'getSportFieldProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getSportFieldHash,
          dependencies: GetSportFieldFamily._dependencies,
          allTransitiveDependencies:
              GetSportFieldFamily._allTransitiveDependencies,
          sport: sport,
        );

  GetSportFieldProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sport,
  }) : super.internal();

  final String? sport;

  @override
  Override overrideWith(
    FutureOr<List<SportField>?> Function(GetSportFieldRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetSportFieldProvider._internal(
        (ref) => create(ref as GetSportFieldRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sport: sport,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<SportField>?> createElement() {
    return _GetSportFieldProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetSportFieldProvider && other.sport == sport;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sport.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetSportFieldRef on AutoDisposeFutureProviderRef<List<SportField>?> {
  /// The parameter `sport` of this provider.
  String? get sport;
}

class _GetSportFieldProviderElement
    extends AutoDisposeFutureProviderElement<List<SportField>?>
    with GetSportFieldRef {
  _GetSportFieldProviderElement(super.provider);

  @override
  String? get sport => (origin as GetSportFieldProvider).sport;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
