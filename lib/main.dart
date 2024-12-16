import 'package:flutter/material.dart';

void main() {
  runApp(const Tasbih());
}

class Tasbih extends StatelessWidget {
  const Tasbih({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          title: Container(
            margin: const EdgeInsets.only(right: 20.0),
            child: const Center(
              child: Text(
                'Tasbih Counter',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          backgroundColor: Colors.grey[850],
        ),
        body: const TasBihCounter(),
      ),
    );
  }
}

class TasBihCounter extends StatefulWidget {
  const TasBihCounter({super.key});

  @override
  State<TasBihCounter> createState() => _TasBihCounterState();
}

class _TasBihCounterState extends State<TasBihCounter> {
  int countNumber = 0;
  bool isMuted = true;

  Expanded topIcons({required color, required icon, VoidCallback? func}) {
    return Expanded(
      child: IconButton(
        onPressed: func,
        icon: Icon(
          icon,
          color: color,
        ),
      ),
    );
  }

  void toggleMute() {
    setState(() {
      isMuted = !isMuted;
    });
  }

  void increment() {
    setState(() {
      countNumber++;
    });
  }

  void resetCount() {
    setState(() {
      countNumber = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      height: 750.0,
      width: double.infinity, // Ensures it spans the full width of the screen
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start, // Aligns content to the top
        children: [
          // Row of icons at the top
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              topIcons(color: Colors.white, icon: Icons.settings),
              topIcons(
                  color: Colors.white,
                  icon: Icons.rotate_left,
                  func: resetCount),
              topIcons(color: Colors.white, icon: Icons.vibration_outlined),
              topIcons(
                  color: Colors.white,
                  icon: isMuted
                      ? Icons.volume_off_outlined
                      : Icons.volume_up_outlined,
                  func: toggleMute),
            ],
          ),
          // Spacer to push the Column to the center
          const Spacer(),
          // Centered Column below the icons
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text(
              //   '$countNumber',
              //   style: const TextStyle(
              //     fontSize: 20.0,
              //     color: Colors.yellow
              //   ),
              // ),
              TextButton(
                style: TextButton.styleFrom(
                    minimumSize: const Size(170.0, 170.0),
                    backgroundColor: Colors.white,
                    shape: const CircleBorder()),
                onPressed: increment,
                child: Text(
                  '$countNumber',
                  style: const TextStyle(
                    color: Colors.black38,
                    fontSize: 30.0,
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ),
            ],
          ),
          // Spacer to balance the remaining space
          const Spacer(),
        ],
      ),
    );
  }
}
