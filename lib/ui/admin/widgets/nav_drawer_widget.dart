import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inspirze_onboarding_app/ui/admin/views/ad/ad_view.dart';
import 'package:inspirze_onboarding_app/ui/admin/views/answers/answers_view.dart';
import 'package:inspirze_onboarding_app/ui/admin/views/dashboard/home_view.dart';
import 'package:inspirze_onboarding_app/ui/admin/views/questionnaire/questioinnaire_view.dart';
import 'package:inspirze_onboarding_app/ui/admin/views/survey/survey_view.dart';
import 'package:inspirze_onboarding_app/ui/admin/views/user/users_view.dart';

import '../views/questions/questions_view.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.20),
            blurRadius: 4)
      ]),
      width: 300,
      child: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                decoration: const BoxDecoration(color: Colors.blueGrey),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                Container()));
                      },
                      child: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://www.google.com/search?q=photo+place+holder&client=ubuntu&channel=fs&sxsrf=ALiCzsZp6Ip95Opfu7DNQ48itBLytw9xOA:1652346715258&tbm=isch&source=iu&ictx=1&vet=1&fir=LzjPXMmak067sM%252C6ubQIcxHzwg4iM%252C_%253BP-Ee9JVR5x9SWM%252CYM0t3tz9czjj1M%252C_%253B6_BE2Bv1oAkV1M%252C7Q1L1mDaxZwCnM%252C_%253Byz9Evs-FmQfYAM%252CioOTPWTJwIC89M%252C_%253BHyNnSDuTADVCzM%252CvDgvnggvaxbxnM%252C_%253BJl2nJbDhPFkMwM%252CYM0t3tz9czjj1M%252C_%253BKSY2xYdGnRgEvM%252C6ubQIcxHzwg4iM%252C_%253BjuUiGFzuPqfPtM%252CZV8N7A6W8SiWDM%252C_%253BIpHv0LpudLkClM%252C7Q1L1mDaxZwCnM%252C_%253B2vPMmqYJEzuiWM%252CjKN_oULurygfxM%252C_%253BwqFTpxdyrrUpwM%252C7pqnA9fEVW3KMM%252C_%253BE9-dfhF34W5_uM%252C7Q1L1mDaxZwCnM%252C_%253B5gYUCMTyYfVWCM%252CcyPowwVV5ZV6IM%252C_%253B8K7kbUE95iuy1M%252C7Q1L1mDaxZwCnM%252C_%253BmHuaKwCHQwBA1M%252C6ubQIcxHzwg4iM%252C_%253BVhD25agnIa4ofM%252CV6YwO4b6U6-zyM%252C_&usg=AI4_-kTyuoSl8FdAL6U46JC8ljkT7JNJmw&sa=X&ved=2ahUKEwiM04iYz9n3AhUQEcAKHRohCFgQ9QF6BAgvEAE#imgrc=wqFTpxdyrrUpwM'),
                        radius: 40.0,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          'Xolani Ndebele',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 25.0),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'mrsbongs@gmail.com',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 14.0),
                        ),
                      ],
                    )
                  ],
                )),
            // Divider(
            //   color: Colors.redAccent,
            // ),
            NavigationListItem(
              title: 'Dashboard',
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const HomeView()));
              },
              icon: Icons.home,
            ),
            const Divider(),
            NavigationListItem(
              title: 'Questions',
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const QuestionsView()));
              },
              icon: Icons.business_center_rounded,
            ),
            const Divider(),
            NavigationListItem(
              title: 'Answers',
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const AnswersView()));
              },
              icon: Icons.people,
            ),
            const Divider(),
            NavigationListItem(
              title: 'Questionnaire',
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const QuestionnaireView()));
              },
              icon: Icons.panorama_fisheye_rounded,
            ),
            const Divider(),
            NavigationListItem(
              title: 'Users',
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const UsersView()));
              },
              icon: Icons.wallet_giftcard,
            ),
            const Divider(),
            NavigationListItem(
              title: 'Ads',
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const AdView()));
              },
              icon: Icons.wallet_giftcard,
            ),
            const Divider(),
            NavigationListItem(
              title: 'Survey',
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const SurveyView()));
              },
              icon: Icons.notes_rounded,
            ),
            const Divider(),
            const Divider(),
            NavigationListItem(
              title: 'Logout',
              onPressed: () {},
              icon: Icons.logout,
            ),
            const SizedBox(height: 100),
            const Positioned(
                left: 20,
                child: Text(
                  '   powered by Inspirze',
                  style: TextStyle(color: Colors.grey),
                ))
            // ListTile(
            //   title: Text("Contact"),
            //   leading: IconButton(
            //     icon: Icon(Icons.contact_page),
            //     onPressed: () {},
            //   ),
            //   onTap: () {
            //     Navigator.of(context).pop();
            //     Navigator.of(context).push(MaterialPageRoute(
            //         builder: (BuildContext context) => ProfileScreen()));
            //   },
            // )
          ],
        ),
      ),
    );
  }
}

class NavigationListItem extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final IconData icon;

  const NavigationListItem({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: onPressed,
      child: Container(
        // decoration: BoxDecoration(boxShadow: [
        //   BoxShadow(
        //     color: Theme.of(context).secondaryHeaderColor,
        //     blurRadius: 2,
        //   )
        // ]),
        child: ListTile(
          leading: Icon(icon),
          title: Text(
            title,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ),
    );
  }
}
