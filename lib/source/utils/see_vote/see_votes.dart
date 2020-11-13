import 'package:e_voting_app/source/index.dart';

class SeeVotes extends StatefulWidget {
  @override
  _SeeVotesState createState() => _SeeVotesState();
}

class _SeeVotesState extends State<SeeVotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Strings.seeVotes),
      ),
      body: Column(
        children: [
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            children: List.generate(6, (index) {
              var vote = 0;
              Strings.candidateVotes.forEach((element) {
                if (element == index.toString()) {
                  vote++;
                }
              });
              return Center(
                child: Container(
                  height: 100,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.blue),
                  ),
                  child: Column(
                    children: [
                      CustomText(
                        text: 'Candidate $index',
                      ),
                      Text(
                        'Vote $vote',
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
          CustomButton(
              ontap: () {
                Strings.candidateVotes.clear();
                PreferenceUtils.clear();
              },
              buttonText: Strings.clearAll),
        ],
      ),
    );
  }
}
