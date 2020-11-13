import 'package:e_voting_app/source/index.dart';
import 'package:e_voting_app/source/user_detail/user_detail.dart';
import 'package:e_voting_app/source/user_detail/user_detail_model.dart';
import 'package:e_voting_app/source/utils/custom_widgets/custom_text_form.dart';
import 'package:e_voting_app/source/utils/preference_keys.dart';

class AuthUser extends StatefulWidget {
  @override
  _AuthUserState createState() => _AuthUserState();
}

class _AuthUserState extends State<AuthUser> {
  String adharNumber = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.authenticate),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            CustomText(
              text: Strings.enterAdharNumber,
              fontSize: 20,
              margin: EdgeInsets.only(top: 40),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 20, left: 40, right: 40),
              child: CustomTextForm(
                  onChanged: (string) {
                    adharNumber = string.replaceAll("-", '');
                  },
                  height: 50,
                  backgroundColor: Colors.white,
                  textInputFormatter: [
                    WhitelistingTextInputFormatter.digitsOnly,
                    new LengthLimitingTextInputFormatter(12),
                    AhdarCardFormatter(),
                  ],
                  keyBoardType: TextInputType.number,
                  hintText: '1111-1111-1111'),
            ),
            Consumer<BiometricProvider>(
              builder: (context, biometricProvider, chld) => CustomButton(
                  ontap: () async {
                    FocusScope.of(context).unfocus();
                    if (adharNumber.isEmpty) {
                      CommonWidgets.showToast(
                          context, Strings.pleaseEnterAdhar);
                    } else if (adharNumber.length < 12) {
                      CommonWidgets.showToast(context, Strings.cantless12);
                    } else if (int.parse(adharNumber) < 0) {
                      CommonWidgets.showToast(context, Strings.notNegative);
                    } else {
                      await biometricProvider.checkBiometrics();
                      if (biometricProvider.canCheckBiometrics == true) {
                        await biometricProvider.authenticate();
                        if (biometricProvider.authorized == 'Authorized') {
                          if (Strings.votingListData
                              .every((user) => user == adharNumber)) {
                            if (PreferenceUtils.getBool(adharNumber)) {
                              CommonWidgets.showToast(
                                  context, Strings.alreadyVoted);
                            } else {
                              CommonWidgets().navigateTO(context,
                                  pageName: UserDetailView(
                                    userDetailModel: UserDetailModel(
                                      adharNumber: adharNumber,
                                      name: 'Some Name',
                                    ),
                                  ));
                            }
                          } else
                            CommonWidgets().navigateTO(context,
                                pageName: UserDetailView(
                                  userDetailModel: UserDetailModel(
                                    adharNumber: adharNumber,
                                    name: 'Some Name',
                                  ),
                                ));
                        }
                      } else {
                        CommonWidgets.showToast(context, Strings.usernotVerify);
                      }
                    }
                  },
                  buttonText: Strings.next),
            )
          ],
        ),
      ),
    );
  }
}
