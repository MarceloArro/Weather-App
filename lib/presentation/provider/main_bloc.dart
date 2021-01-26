import 'package:flutter/material.dart';
import 'package:weather_flutter/domain/repository/local_storage_repository.dart';
import 'package:weather_flutter/presentation/common/theme.dart';

class MainBLoC extends ChangeNotifier {
  ThemeData currentTheme;

  final LocalRepositoryInterface localRepositoryInterface;

  MainBLoC({
    this.localRepositoryInterface,
  });

  void loadTheme() async {
    final isDark = await localRepositoryInterface.isDarkMode() ?? false;
    updateTheme(isDark ? darkTheme : lightTheme);
  }

  void updateTheme(ThemeData theme) {
    currentTheme = theme;
    notifyListeners();
  }
}
