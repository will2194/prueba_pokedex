import 'package:flutter/material.dart';
import 'package:prueba_pokedex/shared/utils/extencions.dart';

class StatWidget extends StatefulWidget {
  final String label;
  final int value;
  final int delayMs;
  final Color color;

  const StatWidget({
    super.key,
    required this.label,
    required this.value,
    required this.delayMs,
    required this.color,
  });

  @override
  State<StatWidget> createState() => _StatWidget();
}

class _StatWidget extends State<StatWidget> {
  double _animatedValue = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: widget.delayMs), () {
      setState(() {
        _animatedValue = widget.value / 252.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: _animatedValue),
      duration: const Duration(milliseconds: 600),
      builder: (context, value, _) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              SizedBox(
                width: 30,
                child: Text(
                  widget.label.shortLabel.toUpperCase(),
                  style: TextStyle(
                    color: widget.color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(widget.value.toString().padLeft(3, '0')),
              const SizedBox(width: 8),
              Expanded(
                child: LinearProgressIndicator(
                  value: value,
                  minHeight: 8,
                  color: widget.color,
                  backgroundColor: widget.color.withValues(alpha: 0.3),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
