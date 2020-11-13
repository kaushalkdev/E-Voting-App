import 'package:e_voting_app/source/index.dart';

class VoterListCheck extends StatefulWidget {
  final UserDetailModel userDetailModel;

  VoterListCheck({@required this.userDetailModel});
  @override
  _VoterListCheckState createState() => _VoterListCheckState();
}

class _VoterListCheckState extends State<VoterListCheck> {
  bool isAvailable = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    findUser();
  }

  Future findUser() async {
    isLoading = true;
    await Future.delayed(Duration(seconds: 2));
    Strings.votingListData
        .every((user) => widget.userDetailModel.adharNumber == user);

    isAvailable = true;
    isLoading = false;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Strings.findyourself),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              CustomText(
                margin: EdgeInsets.only(top: 30),
                alignment: Alignment.center,
                fontSize: 20,
                text: Strings.voterUserlist,
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                height: CommonWidgets().getHeight(context) * 0.70,
                child: ListView(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(top: 20),
                  children: List.generate(Strings.votingListData.length,
                      (index) => userView(index)),
                ),
              ),
              Visibility(
                visible: isAvailable && !isLoading,
                child: CustomButton(
                    ontap: () {
                      CommonWidgets().navigateTO(context,
                          pageName: VoteScreen(
                            userDetailModel: widget.userDetailModel,
                          ));
                    },
                    buttonText: Strings.next),
              ),
              Visibility(
                child: CustomText(
                  alignment: Alignment.center,
                  text: Strings.notEnlisted,
                ),
                visible: !isAvailable && !isLoading,
              ),
              Visibility(
                visible: !isAvailable && !isLoading,
                child: CustomButton(
                    ontap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WelcomePage()),
                          (route) => false);
                    },
                    buttonText: Strings.finish),
              ),
            ],
          ),
          if (isLoading)
            Container(
              height: CommonWidgets().getHeight(context),
              color: Colors.black12,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
        ],
      ),
    );
  }

  Widget userView(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(5),
        color: !isLoading
            ? widget.userDetailModel.adharNumber !=
                    Strings.votingListData[index]
                ? Colors.white
                : Colors.yellowAccent
            : Colors.white,
        child: CommonWidgets.userdata(
            adharNumber: Strings.votingListData[index], name: 'Some name'),
      ),
    );
  }
}
