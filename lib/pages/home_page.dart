import 'package:flutter/material.dart';

import '../models/car.dart';
import '../utils/enums.dart';
import '../utils/functions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Direction _direction = Direction.up;
  int _location = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 10,
              ),
              itemCount: 100,
              itemBuilder: (_, int idx) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.0),
                  ),
                  child: Center(
                      child: idx == _location
                          ? RotationTransition(
                              turns: AlwaysStoppedAnimation(_direction.value),
                              child: const Car(),
                            )
                          : null),
                );
              },
            ),
            Wrap(
              children: [
                ElevatedButton(
                  onPressed: () => setState(() {
                    _direction = getClockwiseDirection(_direction);
                  }),
                  child: const Text('clockwise'),
                ),
                ElevatedButton(
                  onPressed: () => setState(() {
                    _direction = getCounterClockwiseDirection(_direction);
                  }),
                  child: const Text('counterclockwise'),
                ),
                ElevatedButton(
                  onPressed: () => setState(() {
                    _location = newLocation(_location, _direction);
                  }),
                  child: const Text('counterclockwise'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
