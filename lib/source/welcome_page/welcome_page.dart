import 'package:e_voting_app/source/index.dart';
import 'package:e_voting_app/source/utils/see_vote/see_votes.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    Strings.votingListData.forEach((user) {
      PreferenceUtils.putBool(user, false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: CommonWidgets().getHeight(context) * 0.2,
            ),
            CustomText(
              text: Strings.welcomeText,
              fontSize: 30,
            ),
            SizedBox(
              height: CommonWidgets().getHeight(context) * 0.1,
            ),
            helpingText(context),
            Spacer(),
            CustomButton(
                ontap: () {
                  CommonWidgets().navigateTO(context, pageName: AuthUser());
                },
                buttonText: Strings.next),
            CustomButton(
                ontap: () {
                  CommonWidgets().navigateTO(context, pageName: SeeVotes());
                },
                buttonText: Strings.seeVotes)
          ],
        ),
      ),
    );
  }

  Container helpingText(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      padding: const EdgeInsets.only(right: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: Strings.howtouse,
            fontSize: 20,
          ),
          SizedBox(
            height: CommonWidgets().getHeight(context) * 0.02,
          ),
          CustomText(
            textAlign: TextAlign.start,
            text: Strings.verifyYourselfText,
          ),
          SizedBox(
            height: CommonWidgets().getHeight(context) * 0.02,
          ),
          CustomText(
            textAlign: TextAlign.start,
            text: Strings.findyourselfText,
          ),
          SizedBox(
            height: CommonWidgets().getHeight(context) * 0.02,
          ),
          CustomText(
            textAlign: TextAlign.start,
            text: Strings.castVotetextText,
          ),
        ],
      ),
    );
  }
}
