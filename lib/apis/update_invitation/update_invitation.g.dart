// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_invitation.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$updateInvitationHash() => r'c8b49233a6228a18b36a8f055f4eacddd9ea0db3';

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

/// See also [updateInvitation].
@ProviderFor(updateInvitation)
const updateInvitationProvider = UpdateInvitationFamily();

/// See also [updateInvitation].
class UpdateInvitationFamily extends Family<AsyncValue<void>> {
  /// See also [updateInvitation].
  const UpdateInvitationFamily();

  /// See also [updateInvitation].
  UpdateInvitationProvider call(
    UpdateInvitationParam params,
  ) {
    return UpdateInvitationProvider(
      params,
    );
  }

  @override
  UpdateInvitationProvider getProviderOverride(
    covariant UpdateInvitationProvider provider,
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
  String? get name => r'updateInvitationProvider';
}

/// See also [updateInvitation].
class UpdateInvitationProvider extends AutoDisposeFutureProvider<void> {
  /// See also [updateInvitation].
  UpdateInvitationProvider(
    UpdateInvitationParam params,
  ) : this._internal(
          (ref) => updateInvitation(
            ref as UpdateInvitationRef,
            params,
          ),
          from: updateInvitationProvider,
          name: r'updateInvitationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateInvitationHash,
          dependencies: UpdateInvitationFamily._dependencies,
          allTransitiveDependencies:
              UpdateInvitationFamily._allTransitiveDependencies,
          params: params,
        );

  UpdateInvitationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.params,
  }) : super.internal();

  final UpdateInvitationParam params;

  @override
  Override overrideWith(
    FutureOr<void> Function(UpdateInvitationRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateInvitationProvider._internal(
        (ref) => create(ref as UpdateInvitationRef),
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
  AutoDisposeFutureProviderElement<void> createElement() {
    return _UpdateInvitationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateInvitationProvider && other.params == params;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, params.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpdateInvitationRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `params` of this provider.
  UpdateInvitationParam get params;
}

class _UpdateInvitationProviderElement
    extends AutoDisposeFutureProviderElement<void> with UpdateInvitationRef {
  _UpdateInvitationProviderElement(super.provider);

  @override
  UpdateInvitationParam get params =>
      (origin as UpdateInvitationProvider).params;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
