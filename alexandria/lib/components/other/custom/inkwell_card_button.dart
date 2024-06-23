import 'package:flutter/material.dart';

class InkwellCardButton extends StatelessWidget {
  const InkwellCardButton({
    super.key,
    this.onTap,
    required this.child,
  });

  final void Function()? onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      borderRadius: BorderRadius.circular(10),
      splashColor: Colors.transparent,
      highlightColor: Colors.black26,
      child: Card(
        child: child,
      ),
    );
  }
}
