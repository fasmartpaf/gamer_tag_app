import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    this.hint,
    this.onTap,
    this.label,
    this.value,
    this.obscure = false,
    this.suffix,
    this.onSaved,
    this.onChanged,
    this.readonly = false,
    this.validator,
    this.keyboardType,
    this.floatLabel = false,
    this.textEditingController,
    this.isBold = false,
    this.formatters,
    this.maxLines = 1,
    this.textInputAction = TextInputAction.next,
  }) : super(key: key);

  final bool? isBold;

  final bool obscure;
  final String? hint;
  final String? label;
  final String? value;
  final bool readonly;
  final Widget? suffix;
  final bool floatLabel;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final FormFieldSetter<String?>? onSaved;
  final FormFieldSetter<String?>? onChanged;
  final FormFieldValidator<String?>? validator;
  final TextEditingController? textEditingController;
  final List<TextInputFormatter>? formatters;
  final int? maxLines;

//  final int? minLines;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        onTap: onTap,
        onSaved: onSaved,
        onChanged: onChanged,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        inputFormatters: formatters,
        readOnly: readonly,
        initialValue: value,
        maxLines: maxLines,
        //minLines: minLines,
        validator: validator,
        obscureText: obscure,
        controller: textEditingController,
        scrollPadding: const EdgeInsets.all(100),
        decoration: InputDecoration(
          hintText: hint,
          contentPadding: const EdgeInsets.all(20),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(4),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(4),
          ),
          floatingLabelBehavior: floatLabel
              ? FloatingLabelBehavior.always
              : FloatingLabelBehavior.auto,
          labelText: label,
          suffixIcon: suffix,
        ),
      ),
    );
  }
}

class AppPasswordField extends StatefulWidget {
  final IconData? icon;
  final String? hint;
  final bool iconBool;
  final bool? readOnly;
  final String? label;
  final BuildContext? context;
  final FormFieldValidator<String?>? validator;
  final TextEditingController? textEditingController;

  const AppPasswordField(
      {Key? key,
      this.icon,
      this.label,
      this.validator,
      this.hint,
      this.readOnly,
      this.context,
      required this.iconBool,
      this.textEditingController // this.validator,
      })
      : super(key: key);

  @override
  _AppPasswordFieldState createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {
  bool _show = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        validator: widget.validator,
        obscureText: _show,
        controller: widget.textEditingController,
        textInputAction: TextInputAction.next,
        readOnly: widget.readOnly ?? false,
        onFieldSubmitted: (v) {
          FocusScope.of(context).nextFocus();
        },
        style: const TextStyle(),
        scrollPadding: const EdgeInsets.all(180),
        decoration: InputDecoration(
          hintText: widget.hint,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          suffixIcon: widget.iconBool
              ? TextButton(
                  child: Icon(_show ? Icons.visibility_off : Icons.visibility,
                      color: _show ? Colors.grey : Colors.blue),
                  onPressed: () => setState(() => _show = !_show),
                )
              : const SizedBox(),
          labelText: widget.label,
        ),
      ),
    );
  }
}

class AppTextFieldWithMaxLines extends StatefulWidget {
  final String label;
  final VoidCallback? onTap;
  final FormFieldSetter<String?>? onSaved;
  final FormFieldSetter<String?>? onChanged;
  final FormFieldValidator<String?>? validator;
  final TextEditingController? textEditingController;

  const AppTextFieldWithMaxLines({
    Key? key,
    this.onTap,
    this.validator,
    this.onChanged,
    required this.label,
    this.textEditingController,
    this.onSaved,
  }) : super(key: key);

  @override
  _AppTextFieldWithMaxLinesState createState() =>
      _AppTextFieldWithMaxLinesState();
}

class _AppTextFieldWithMaxLinesState extends State<AppTextFieldWithMaxLines> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.textEditingController,
      textInputAction: TextInputAction.done,
      validator: widget.validator,
      maxLines: 8,
      decoration: InputDecoration(
          hintText: 'Start Typing..',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          label: Text(
            widget.label,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          )),
    );
  }
}
