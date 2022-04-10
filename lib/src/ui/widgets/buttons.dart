import 'package:flutter/material.dart';

class AuthButton extends StatefulWidget {
  final String text;
  final String btnImage;
  final VoidCallback onTap;
  final Color? colorBtn;
  final Color? colorText;

  const AuthButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.colorBtn,
    required this.btnImage,
    this.colorText,
  }) : super(key: key);

  @override
  _AuthButtonState createState() => _AuthButtonState();
}

class _AuthButtonState extends State<AuthButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ElevatedButton.styleFrom(
        maximumSize: const Size(300, 60),
        primary: widget.colorBtn ?? Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(120),
        ),
        splashFactory: InkSplash.splashFactory,
        shadowColor: Colors.white,
      ),
      onPressed: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 5,),
        child: Row(
          children: [
            Container(
              width: 35,
              height: 35,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(5),
              child: Image.asset(widget.btnImage),
            ),
            const SizedBox(
              width: 40,
            ),
            Text(
              widget.text,
              style: TextStyle(
                fontSize: 13,
                color: widget.colorText ?? Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
