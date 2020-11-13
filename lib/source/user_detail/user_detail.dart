import 'package:e_voting_app/source/index.dart';
import 'package:e_voting_app/source/user_detail/user_detail_model.dart';

class UserDetailView extends StatefulWidget {
  final UserDetailModel userDetailModel;
  UserDetailView({@required this.userDetailModel});
  @override
  _UserDetailViewState createState() => _UserDetailViewState();
}

class _UserDetailViewState extends State<UserDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          Strings.userDetails,
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 40),
          CommonWidgets.userdata(
              name: widget.userDetailModel.name,
              adharNumber: widget.userDetailModel.adharNumber),
          Container(
            margin: EdgeInsets.only(right: 100, top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: Strings.dob,
                ),
                CustomText(
                  text: Strings.address,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          CustomButton(
              ontap: () {
                CommonWidgets().navigateTO(context,
                    pageName: VoterListCheck(
                      userDetailModel: widget.userDetailModel,
                    ));
              },
              buttonText: Strings.next),
        ],
      ),
    );
  }
}
