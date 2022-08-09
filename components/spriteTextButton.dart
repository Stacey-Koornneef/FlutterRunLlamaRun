import 'package:flutter/material.dart';
import 'package:flame/components.dart';
import 'package:flame/input.dart';

class SpriteTextButton extends SpriteButtonComponent {
  TextComponent? buttonText;

  SpriteTextButton(
      {Sprite? button,
        int? priority,
        Vector2? scale,
        Vector2? position,
        var onPressed,
        String? text,
        double? textXShift,
        double? textYShift}) : super(button: button,
      priority: priority, scale: scale, position: position,
      onPressed: onPressed) {

    buttonText = TextComponent(
        position: position! + Vector2(textXShift!, textYShift!),
        text: text,
        textRenderer: TextPaint(
          style: const TextStyle(color: Colors.white, fontSize: 350, shadows: [
            Shadow(
              blurRadius: 7,
              color: Colors.black45,
              offset: Offset(3, 3),
            ),
          ]),
        ),
        priority: priority! + 1
    );

    add(buttonText!);
  }
}
