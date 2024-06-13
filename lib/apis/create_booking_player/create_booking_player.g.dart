// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_booking_player.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$createBookingPlayerHash() =>
    r'81a3c00b15e39122b9dd6e79e977877d9be9946c';

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

/// See also [createBookingPlayer].
@ProviderFor(createBookingPlayer)
const createBookingPlayerProvider = CreateBookingPlayerFamily();

/// See also [createBookingPlayer].
class CreateBookingPlayerFamily extends Family<AsyncValue<void>> {
  /// See also [createBookingPlayer].
  const CreateBookingPlayerFamily();

  /// See also [createBookingPlayer].
  CreateBookingPlayerProvider call(
    CreateBookingPlayerBody data,
  ) {
    return CreateBookingPlayerProvider(
      data,
    );
  }

  @override
  CreateBookingPlayerProvider getProviderOverride(
    covariant CreateBookingPlayerProvider provider,
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
  String? get name => r'createBookingPlayerProvider';
}

/// See also [createBookingPlayer].
class CreateBookingPlayerProvider extends AutoDisposeFutureProvider<void> {
  /// See also [createBookingPlayer].
  CreateBookingPlayerProvider(
    CreateBookingPlayerBody data,
  ) : this._internal(
          (ref) => createBookingPlayer(
            ref as CreateBookingPlayerRef,
            data,
          ),
          from: createBookingPlayerProvider,
          name: r'createBookingPlayerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createBookingPlayerHash,
          dependencies: CreateBookingPlayerFamily._dependencies,
          allTransitiveDependencies:
              CreateBookingPlayerFamily._allTransitiveDependencies,
          data: data,
        );

  CreateBookingPlayerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.data,
  }) : super.internal();

  final CreateBookingPlayerBody data;

  @override
  Override overrideWith(
    FutureOr<void> Function(CreateBookingPlayerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateBookingPlayerProvider._internal(
        (ref) => create(ref as CreateBookingPlayerRef),
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
    return _CreateBookingPlayerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateBookingPlayerProvider && other.data == data;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, data.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CreateBookingPlayerRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `data` of this provider.
  CreateBookingPlayerBody get data;
}

class _CreateBookingPlayerProviderElement
    extends AutoDisposeFutureProviderElement<void> with CreateBookingPlayerRef {
  _CreateBookingPlayerProviderElement(super.provider);

  @override
  CreateBookingPlayerBody get data =>
      (origin as CreateBookingPlayerProvider).data;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
