import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:star_wars/core/shared/shared.dart';
import 'package:star_wars/features/features.dart';

class StateNotifiers {
  const StateNotifiers._();
  static final gender = StateNotifierProvider<ValueProvider<Gender>, Gender>(
    (_) => ValueProvider(Gender.all),
  );
}
