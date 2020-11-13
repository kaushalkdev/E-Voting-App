import 'package:e_voting_app/source/index.dart';

class CustomTextForm extends StatelessWidget {
  final double height;
  final double width;
  final String initialValue;
  final String hintText;
  final Function validator;
  final bool obscureText;
  final Color borderColor;
  final int maxLines;
  final int maxLength;
  final List<TextInputFormatter> textInputFormatter;
  final EdgeInsetsGeometry padding;
  final TextAlign textAlign;
  final TextInputType keyBoardType;
  final Function onSaved;
  final Color backgroundColor;
  final Function(String) onChanged;
  final TextEditingController controller;

  const CustomTextForm({
    Key key,
    this.obscureText,
    @required this.keyBoardType,
    @required this.hintText,
    this.validator,
    this.onSaved,
    this.backgroundColor,
    this.borderColor,
    this.maxLines,
    this.height,
    this.width,
    this.textAlign,
    this.padding,
    this.maxLength,
    this.textInputFormatter,
    this.onChanged,
    this.controller,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? CommonWidgets().getWidth(context) * 0.9,
      height: height ?? CommonWidgets().getWidth(context) * 0.06,
      decoration: BoxDecoration(
          border: Border.all(color: borderColor ?? Colors.grey),
          borderRadius: BorderRadius.all(
            Radius.circular(23),
          ),
          color: backgroundColor ?? Colors.grey),
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: TextFormField(
          initialValue: initialValue ?? null,
          inputFormatters: textInputFormatter ?? null,
          maxLength: maxLength ?? null,
          maxLines: maxLines ?? 1,
          keyboardType: keyBoardType,
          obscureText: obscureText ?? false,
          textAlign: textAlign ?? TextAlign.center,
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
            counterText: '',
            counterStyle: TextStyle(fontSize: 0),
          ),
          validator: validator,
          onSaved: onSaved,
          onChanged: onChanged,
          controller: controller,
        ),
      ),
    );
  }
}
