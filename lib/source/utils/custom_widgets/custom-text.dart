import 'package:e_voting_app/source/index.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double width;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
  final EdgeInsetsGeometry margin, padding;
  final String fontFamily;
  final TextAlign textAlign;
  final AlignmentGeometry alignment;
  final int maxLines;
  const CustomText({
    Key key,
    this.text,
    this.color,
    this.fontWeight,
    this.fontSize,
    this.textAlign,
    this.fontFamily,
    this.alignment,
    this.margin,
    this.padding,
    this.width,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? null,
      margin: margin ?? null,
      padding: padding ?? null,
      alignment: alignment ?? null,
      child: Text(text ?? "",
          maxLines: maxLines ?? null,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontFamily: fontFamily ?? 'Roboto',
              color: color ?? Colors.black,
              fontWeight: fontWeight ?? FontWeight.w500,
              fontSize: fontSize ?? 16),
          textAlign: textAlign ?? TextAlign.center),
    );
  }
}
