import 'package:e_voting_app/source/index.dart';

class CommonWidgets {
  static Widget userdata({
    String name,
    String adharNumber,
  }) {
    return Row(
      children: [
        SizedBox(
          width: 20,
        ),
        CommonWidgets.userimage(),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: name,
            ),
            CustomText(
              text: adharNumber,
            ),
          ],
        )
      ],
    );
  }

  double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static Widget divider = Divider(
    thickness: 1,
    indent: 20,
    endIndent: 20,
    color: Colors.grey,
  );

  double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  navigateTO(BuildContext context, {@required Widget pageName}) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => pageName),
    );
  }

  navigateReplacement(BuildContext context, {@required Widget pageName}) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => pageName),
    );
  }

  navigateBack(BuildContext context) {
    Navigator.pop(context);
  }

  static showToast(BuildContext context, String message, {int duration}) {
    return Toast.show(message, context,
        gravity: Toast.BOTTOM, duration: duration ?? Toast.LENGTH_SHORT);
  }

  static showLoadingDialog(BuildContext context, String message) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        child: AlertDialog(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircularProgressIndicator(),
              Text(
                message,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              )
            ],
          ),
        ));
  }

  static Container showLoader(BuildContext context) {
    return Container(
      height: CommonWidgets().getHeight(context),
      width: CommonWidgets().getWidth(context),
      color: Colors.black12,
      child: Center(child: CircularProgressIndicator()),
    );
  }

  Container customTextFormField(BuildContext context, String hintText,
      {IconData iconData,
      double height,
      double width,
      bool readOnly,
      bool showCursor,
      int maxlines,
      double radius,
      bool isEnable = true,
      TextEditingController controller,
      inputType,
      Function onChanged}) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 5),
      padding: EdgeInsets.only(left: 15),
      height: height ?? CommonWidgets().getHeight(context) * 0.06,
      width: width ?? CommonWidgets().getWidth(context) * 0.65,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(radius ?? 50),
        color: Colors.white,
      ),
      child: Center(
        child: Container(
          child: TextFormField(
            onChanged: onChanged,
            controller: controller,
            enabled: isEnable,
            keyboardType: inputType,
            maxLines: maxlines ?? 1,
            readOnly: readOnly ?? true,
            showCursor: showCursor ?? false,
            decoration: InputDecoration(
              suffixIcon: iconData != null
                  ? Icon(
                      iconData,
                      color: Colors.grey,
                    )
                  : null,
              hintText: hintText,
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }

  Widget roundButton(text, context, {Function onTap}) {
    return SizedBox(
      width: 192,
      height: 46,
      child: RaisedButton(
          child: Text(text,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Roboto",
                  package: 'assets/fonts/Roboto-Medium',
                  fontStyle: FontStyle.normal,
                  fontSize: 16),
              textAlign: TextAlign.center),
          onPressed: onTap,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
          color: Colors.yellow),
    );
  }

  void navigateTo(context, page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  Widget customFormField(
          {BuildContext context,
          String hint,
          int maxText,
          TextInputAction textInputAction,
          Function(String) onChanged,
          TextInputType inputType = TextInputType.text,
          String inital}) =>
      Container(
        height: 50,
        padding: EdgeInsets.only(left: 15.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            border: Border.all(color: Colors.grey, width: 1),
            color: Colors.white),
        child: Container(
          child: Padding(
            padding: EdgeInsets.only(left: 5, right: 5),
            child: TextFormField(
              initialValue: inital ?? null,
              keyboardType: inputType,
              textInputAction: textInputAction ?? TextInputAction.done,
              maxLength: maxText,
              decoration: InputDecoration(
                counterText: '',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                hintText: hint,
                border: InputBorder.none,
              ),
              maxLines: 1,
              onChanged: onChanged,
            ),
          ),
        ),
      );

  static showCustomDialog(
      BuildContext context, String title, String message, Function onYes) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        child: AlertDialog(
          title: CustomText(
            text: title,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText(
                text: message,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                    ontap: onYes,
                    buttonText: Strings.yes,
                    width: 70,
                  ),
                  CustomButton(
                      width: 70,
                      ontap: () {
                        CommonWidgets().navigateBack(context);
                      },
                      buttonText: Strings.no)
                ],
              )
            ],
          ),
        ));
  }

  static Widget userimage() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(
            30,
          )),
      child: Icon(
        Icons.person_rounded,
        size: 50,
        color: Colors.grey,
      ),
    );
  }
}

class AhdarCardFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = new StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write('-'); // Add double spaces.
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: new TextSelection.collapsed(offset: string.length));
  }
}
