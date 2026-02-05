import 'package:flutter/material.dart';

class ComonButton extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  final bool? isLoding;

  const ComonButton({
    super.key,
    required this.title,
    required this.onTap,
    this.isLoding = false,
  });

  @override
  State<ComonButton> createState() => _ComonButtonState();
}

class _ComonButtonState extends State<ComonButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isLoding! ? null : widget.onTap,
      child: Container(
        height: 44,
        width: 200,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFFC471F5), // Light Purple
              Color(0xFF7F38F5), // Dark Purple
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: widget.isLoding!
            ? const CircularProgressIndicator(
                color: Colors.white, strokeWidth: 2)
            : Text(
                widget.title,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
      ),
    );
  }
}
