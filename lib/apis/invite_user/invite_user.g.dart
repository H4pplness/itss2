// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invite_user.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$inviteUserHash() => r'cca86f1fe9fb308ff99a3c6b8e0409073199f7a6';

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

/// See also [inviteUser].
@ProviderFor(inviteUser)
const inviteUserProvider = InviteUserFamily();

/// See also [inviteUser].
class InviteUserFamily extends Family<AsyncValue<void>> {
  /// See also [inviteUser].
  const InviteUserFamily();

  /// See also [inviteUser].
  InviteUserProvider call(
    String? bookingPlayerId,
  ) {
    return InviteUserProvider(
      bookingPlayerId,
    );
  }

  @override
  InviteUserProvider getProviderOverride(
    covariant InviteUserProvider provider,
  ) {
    return call(
      provider.bookingPlayerId,
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
  String? get name => r'inviteUserProvider';
}

/// See also [inviteUser].
class InviteUserProvider extends AutoDisposeFutureProvider<void> {
  /// See also [inviteUser].
  InviteUserProvider(
    String? bookingPlayerId,
  ) : this._internal(
          (ref) => inviteUser(
            ref as InviteUserRef,
            bookingPlayerId,
          ),
          from: inviteUserProvider,
          name: r'inviteUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$inviteUserHash,
          dependencies: InviteUserFamily._dependencies,
          allTransitiveDependencies:
              InviteUserFamily._allTransitiveDependencies,
          bookingPlayerId: bookingPlayerId,
        );

  InviteUserProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.bookingPlayerId,
  }) : super.internal();

  final String? bookingPlayerId;

  @override
  Override overrideWith(
    FutureOr<void> Function(InviteUserRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: InviteUserProvider._internal(
        (ref) => create(ref as InviteUserRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        bookingPlayerId: bookingPlayerId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _InviteUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is InviteUserProvider &&
        other.bookingPlayerId == bookingPlayerId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, bookingPlayerId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin InviteUserRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `bookingPlayerId` of this provider.
  String? get bookingPlayerId;
}

class _InviteUserProviderElement extends AutoDisposeFutureProviderElement<void>
    with InviteUserRef {
  _InviteUserProviderElement(super.provider);

  @override
  String? get bookingPlayerId => (origin as InviteUserProvider).bookingPlayerId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
