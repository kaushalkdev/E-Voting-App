import 'package:e_voting_app/source/index.dart';

class CustomButton extends StatelessWidget {
  final Function ontap;
  final String buttonText;
  final double height;
  final double width;
  final Alignment alignment;
  final EdgeInsetsGeometry margin;
  final Color color;
  const CustomButton({
    Key key,
    @required this.ontap,
    @required this.buttonText,
    this.height,
    this.width,
    this.color,
    this.margin,
    this.alignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        alignment: alignment ?? Alignment.bottomCenter,
        margin: margin ?? EdgeInsets.only(top: 20, bottom: 20),
        width: width ?? 200,
        height: height ?? 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          color: color ?? Colors.blue,
        ),
        child: Center(
            child: CustomText(
                text: buttonText,
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16.0)),
      ),
    );
  }
}
