import 'package:animood/src/app/models/spirit.dart';
import 'package:animood/src/app/views/widgets/spirit_widget.dart';
import 'package:animood/src/core/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animood',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        allowImplicitScrolling: true,
        itemCount: Spirit.all.length,
        itemBuilder: (context, index) {
          return Center(
            child: SpiritWidget(
              spirit: Spirit.all[index],
              size: 180,
            ),
          );
        },
      ),
    );
  }
}
