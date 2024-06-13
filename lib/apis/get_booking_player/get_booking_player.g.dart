// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_booking_player.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getBookingPlayerHash() => r'fb7d488643ba8c0962c7a96adac39a541b25b921';

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

/// See also [getBookingPlayer].
@ProviderFor(getBookingPlayer)
const getBookingPlayerProvider = GetBookingPlayerFamily();

/// See also [getBookingPlayer].
class GetBookingPlayerFamily
    extends Family<AsyncValue<List<GetBookingPlayerDTO>?>> {
  /// See also [getBookingPlayer].
  const GetBookingPlayerFamily();

  /// See also [getBookingPlayer].
  GetBookingPlayerProvider call(
    GetBookingPlayerParams params,
  ) {
    return GetBookingPlayerProvider(
      params,
    );
  }

  @override
  GetBookingPlayerProvider getProviderOverride(
    covariant GetBookingPlayerProvider provider,
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
  String? get name => r'getBookingPlayerProvider';
}

/// See also [getBookingPlayer].
class GetBookingPlayerProvider
    extends AutoDisposeFutureProvider<List<GetBookingPlayerDTO>?> {
  /// See also [getBookingPlayer].
  GetBookingPlayerProvider(
    GetBookingPlayerParams params,
  ) : this._internal(
          (ref) => getBookingPlayer(
            ref as GetBookingPlayerRef,
            params,
          ),
          from: getBookingPlayerProvider,
          name: r'getBookingPlayerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getBookingPlayerHash,
          dependencies: GetBookingPlayerFamily._dependencies,
          allTransitiveDependencies:
              GetBookingPlayerFamily._allTransitiveDependencies,
          params: params,
        );

  GetBookingPlayerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.params,
  }) : super.internal();

  final GetBookingPlayerParams params;

  @override
  Override overrideWith(
    FutureOr<List<GetBookingPlayerDTO>?> Function(GetBookingPlayerRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetBookingPlayerProvider._internal(
        (ref) => create(ref as GetBookingPlayerRef),
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
  AutoDisposeFutureProviderElement<List<GetBookingPlayerDTO>?> createElement() {
    return _GetBookingPlayerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetBookingPlayerProvider && other.params == params;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, params.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetBookingPlayerRef
    on AutoDisposeFutureProviderRef<List<GetBookingPlayerDTO>?> {
  /// The parameter `params` of this provider.
  GetBookingPlayerParams get params;
}

class _GetBookingPlayerProviderElement
    extends AutoDisposeFutureProviderElement<List<GetBookingPlayerDTO>?>
    with GetBookingPlayerRef {
  _GetBookingPlayerProviderElement(super.provider);

  @override
  GetBookingPlayerParams get params =>
      (origin as GetBookingPlayerProvider).params;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
