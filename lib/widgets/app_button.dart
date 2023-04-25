import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  final bool expanded;
  final Color? textColor;

  const AppButton.expanded({
    Key? key,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
  })  : expanded = true,
        super(key: key);

  const AppButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
  })  : expanded = false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (expanded) {
      return Row(
        children: [
          Expanded(
            child: _button(context),
          )
        ],
      );
    }
    return _button(context);
  }

  Widget _button(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Material(
        elevation: 8.0,
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          side: BorderSide(
            color: Color.fromRGBO(62, 39, 123, 1),
            width: 2,
          ),
        ),
        child: InkWell(
          onTap: onPressed,
          child: Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
              child: Text(label.toUpperCase(),
                  style: Theme.of(context)
                      .primaryTextTheme
                      .bodyLarge
                      ?.copyWith(color: textColor)),
            ),
          ),
        ),
      ),
    );
  }
}
