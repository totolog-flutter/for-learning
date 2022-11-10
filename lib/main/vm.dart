import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_youtube1/data/postal_code.dart';
import 'package:flutter_youtube1/main/logic.dart';

final _logicProvider = Provider<AddressLogic>((ref) => AddressLogic());
final _postalCodeProvider = StateProvider<String>((ref) => '');
final _apiFamilyProvider = FutureProvider.autoDispose
    .family<PostalCode, String>((ref, postalCode) async {
  AddressLogic addressLogic = ref.watch(_logicProvider);
  if (!addressLogic.canProceed(postalCode)) return PostalCode.empty;
  return await addressLogic.getPostalCode(postalCode);
});

class MainVm {
  late final WidgetRef _ref;
  String get postalCode => _ref.watch(_postalCodeProvider);
  AsyncValue<PostalCode> postalCodeWithFamily(String postalCode) =>
      _ref.watch(_apiFamilyProvider(postalCode));
  void onPostalCodeChanged(String postalCode) {
    _ref.read(_postalCodeProvider.notifier).update((state) => postalCode);
  }

  void setRef(WidgetRef ref) {
    _ref = ref;
  }
}
