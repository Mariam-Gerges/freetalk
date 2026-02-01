import 'package:flutter/material.dart';

class SplashLoader extends StatefulWidget {
  const SplashLoader({super.key});

  @override
  State<SplashLoader> createState() => _SplashLoaderState();
}

class _SplashLoaderState extends State<SplashLoader> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 900))..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildDot(int index) {
    // staggered intervals for each dot
    final start = index * 0.15;
    final end = start + 0.6;
    final animation = CurvedAnimation(parent: _controller, curve: Interval(start, end, curve: Curves.easeInOut));

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        final scale = 0.6 + (animation.value * 0.6);
        final opacity = 0.4 + (animation.value * 0.6);
        return Opacity(
          opacity: opacity,
          child: Transform.scale(
            scale: scale,
            child: child,
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        width: 8,
        height: 8,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) => _buildDot(index)),
    );
  }
}
