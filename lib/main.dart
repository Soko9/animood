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
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView.separated(
          itemCount: Spirit.all.length,
          separatorBuilder: (_, _) => Divider(
            height: 48,
            thickness: 0.7,
            color: Colors.grey.shade200,
            indent: 24,
            endIndent: 24,
          ),
          itemBuilder: (_, index) {
            return Container(
              padding: const EdgeInsets.all(8),
              color: Spirit.all[index].color.withValues(alpha: 0.075),
              child: SpiritWidget(spirit: Spirit.all[index]),
            );
          },
        ),
      ),
    );
  }
}
