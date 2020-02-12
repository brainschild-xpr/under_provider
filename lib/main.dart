import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'states/app_state.dart';
import 'states/user_state.dart';
import './root.dart';

void main() => runApp(MultiProvider(
      providers: [
        // Provider<AppState>(create: (_) => AppState()),
        // Provider<UserState>(create: (_) => UserState()),
        ChangeNotifierProvider.value(value: UserState()),
        ChangeNotifierProvider.value(value: AppState())
      ],
      child: MaterialApp(
        home: Root(),
      ),
    ));
