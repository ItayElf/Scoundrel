import 'package:flutter/material.dart';
import 'package:scoundrel/screens/game_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Scoundrel", style: TextStyle(fontSize: 90)),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const GameScreen()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text("Explore!", style: TextStyle(fontSize: 36)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
