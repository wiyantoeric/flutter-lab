import 'package:flutter/material.dart';

const primary = Color(0xFFB72300);
const secondary = Color(0xFF77574F);
const onPrimary = Color(0xFFFFFFFF);
const onSecondary = Color(0xFFFFFFFF);
const error = Color(0xFFBA1A1A);
const onError = Color(0xFFFFFFFF);
const myPink = Color(0xFFFFDAD3);
const myBrown = Color(0xFF3D0600);

final _base = ThemeData.light();

final myTheme = _base.copyWith(
  useMaterial3: true,
  scaffoldBackgroundColor: myPink,
  appBarTheme: _base.appBarTheme
      .copyWith(backgroundColor: myPink, scrolledUnderElevation: 0.0),
  colorScheme: _base.colorScheme.copyWith(
      primary: primary,
      onPrimary: onPrimary,
      secondary: secondary,
      onSecondary: onSecondary,
      error: error,
      onError: onError,
      background: myPink),
  typography: Typography.material2021(),
  textTheme: _base.textTheme.apply(
    displayColor: myBrown,
    bodyColor: myBrown,
  ),
  iconTheme: _base.iconTheme.copyWith(color: secondary),
  chipTheme: _base.chipTheme.copyWith(
      backgroundColor: secondary,
      labelStyle: const TextStyle(color: onSecondary)),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        backgroundColor: primary, foregroundColor: onPrimary),
  ),
);
