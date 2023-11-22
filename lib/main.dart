import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:star_wars/core/core.dart';

void main() {
  runApp(const ProviderScope(child: StarWarsApp()));
}
