import 'package:flutter/material.dart';

import '../../config/custom.colors.dart';

class QuantityWidget extends StatelessWidget {
  final int value;
  final String suffixText;
  final Function(int quantity) result;

  const QuantityWidget({
    Key? key,
    required this.value,
    required this.suffixText,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            spreadRadius: 1,
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          // Botão Remover
          _QuantityWidget(
            color: Colors.grey,
            icon: Icons.remove,
            onPressed: () {
              if (value == 1) return;

              int resultCount = value - 1;

              result(resultCount);
            },
          ),

          // Texto Unidade De Medida
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              '$value$suffixText',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Botão Adicionar
          _QuantityWidget(
            color: CustomColors.customSwatchColor,
            icon: Icons.add,
            onPressed: () {
              int resultCount = value + 1;

              result(resultCount);
            },
          ),
        ],
      ),
    );
  }
}

class _QuantityWidget extends StatelessWidget {
  final Color color;

  final IconData icon;

  final VoidCallback onPressed;

  const _QuantityWidget({
    Key? key,
    required this.color,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: onPressed,
        child: Ink(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 16,
          ),
        ),
      ),
    );
  }
}
