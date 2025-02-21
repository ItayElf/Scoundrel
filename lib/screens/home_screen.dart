import 'package:flutter/material.dart';
import 'package:scoundrel/screens/game_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int highScore = 0;

  void loadHighScore() {
    SharedPreferences.getInstance().then(
      (perfs) => setState(() {
        highScore = perfs.getInt("highScore") ?? 0;
      }),
    );
  }

  @override
  void initState() {
    super.initState();
    loadHighScore();
  }

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
                  Navigator.of(context)
                      .push(
                        MaterialPageRoute(
                          builder: (context) => const GameScreen(),
                        ),
                      )
                      .then((_) => loadHighScore());
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text("Explore!", style: TextStyle(fontSize: 36)),
                ),
              ),
              SizedBox(height: 24),
              Text("High score: $highScore", style: TextStyle(fontSize: 24)),
            ],
          ),
        ),
      ),
    );
  }
}
