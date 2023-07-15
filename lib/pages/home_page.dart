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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ControlButton(
                  'Turn Right',
                  onPressed: () => setState(() {
                    _direction = getCounterClockwiseDirection(_direction);
                  }),
                ),
                const SizedBox(width: 8.0),
                ControlButton(
                  'Move',
                  onPressed: () => setState(() {
                    _location = newLocation(_location, _direction);
                  }),
                ),
                const SizedBox(width: 8.0),
                ControlButton(
                  'Turn Left',
                  onPressed: () => setState(() {
                    _direction = getClockwiseDirection(_direction);
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ControlButton extends StatelessWidget {
  const ControlButton(
    this.text, {
    super.key,
    required this.onPressed,
  });
  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          overflow: TextOverflow.visible,
          softWrap: false,
        ),
      ),
    );
  }
}
