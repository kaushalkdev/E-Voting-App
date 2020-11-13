import 'package:e_voting_app/source/index.dart';
import 'package:e_voting_app/source/utils/preference_keys.dart';

class VoteScreen extends StatefulWidget {
  final UserDetailModel userDetailModel;

  VoteScreen({@required this.userDetailModel});
  @override
  _VoteScreenState createState() => _VoteScreenState();
}

class _VoteScreenState extends State<VoteScreen> {
  bool ontapped = false;
  String candidate = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Strings.castVote),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                children: List.generate(6, (index) {
                  return Center(
                    child: GestureDetector(
                      onTap: () {
                        candidate = index.toString();
                        setState(() {});
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: candidate == index.toString()
                              ? Colors.green
                              : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.blue),
                        ),
                        child: Text(
                          'Candidate $index',
                        ),
                      ),
                    ),
                  );
                }),
              ),
              Center(
                child: CustomButton(
                    ontap: () async {
                      if (candidate.isEmpty) {
                        CommonWidgets.showToast(
                            context, Strings.selectCandidate);
                      } else {
                        ontapped = true;
                        setState(() {});
                        await Future.delayed(Duration(seconds: 2));
                        CommonWidgets.showToast(context, 'Voted Successfully');
                        await Future.delayed(Duration(milliseconds: 200));
                        ontapped = false;
                        setState(() {});
                        // PreferenceUtils.putBool(
                        //     widget.userDetailModel.adharNumber, true);
                        Strings.candidateVotes.add(candidate);
                        Strings.candidateVotes.forEach((element) {
                          print(element);
                        });
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WelcomePage()),
                            (route) => false);
                      }
                    },
                    buttonText: Strings.castVote),
              ),
            ],
          ),
          if (ontapped)
            Container(
              height: CommonWidgets().getHeight(context),
              color: Colors.black26,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
        ],
      ),
    );
  }
}
