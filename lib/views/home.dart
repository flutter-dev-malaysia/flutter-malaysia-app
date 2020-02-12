import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_my_meeting/widgets/meetupCard.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Image(
                image: AssetImage('lib/assets/images/logo_dark.png'),
                height: 50,
              ),
              Row(
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        FontAwesomeIcons.link,
                        color: Colors.blue[100],
                        size: 16,
                      ),
                      onPressed: _linksDialog),
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.shareAlt,
                      color: Colors.blue[100],
                      size: 16,
                    ),
                    onPressed: () {
                      Share.share('https://t.me/flutterdevmalaysia');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * .05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    'Next Meetup',
                    style: TextStyle(fontSize: 24, color: Colors.grey[800]),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: MediaQuery.of(context).size.width * .9,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    color: Colors.lightBlue[200],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'Flutter Cyberjaya MeetUp #2',
                        style: TextStyle(fontSize: 20),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(right: 8, bottom: 6),
                            child: Icon(FontAwesomeIcons.calendarAlt, size: 20),
                          ),
                          const Text(
                            'To be announced',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    "Previous Meetup's",
                    style: TextStyle(fontSize: 24, color: Colors.grey[800]),
                  ),
                ),
                const MeetupCard(
                  photoUrl:
                      'https://lh3.googleusercontent.com/3dtkK3kpns2jY6m73CKgqppE_WS6SkoBxEYQQE5GmjWDT2XIc-KoR8NpwZ4kRW4FSIvX8rSNUMDmIYe5Rd59jiAOVQc8BSCf8Ef8Z6U15WzIb-BXfg3nmYnQ0ThPcGeZQ-a3FxHHSv5LSP4jkqQN-9yTavfcZtLuGAI_XWpCJaRH6SAt1xdNSEkzkvpEbFp7NkMPRqnGMR2MSIP-5T7Wd_IKGp3-M019zBDV7JtSjZ6ToNBPrZasUQ4Hlz1UkAtEPGSgrcfCwmrB1DqIUxVEvPiRtqZ9GAF5OEFAIARwe0mdKSLOdyornupBojdpIUSzSpOmA-MHISCyfQidvllcmSu-6aWhhebndNQmuOtpfol9tvwKyB591Lp2vNfKX7YgHDLLj6rwisX7bb9QzjsMxoed1zKy6qNZ0EFEik4O0T09aGst06x0QaFqsW-yc9BYgggPQHzs2ZpUgQsL_nJ3dih4XnwweUKcbK88jZdm0UKAA5Dv3q2CtANaja-b2iT8oP7i3hjoAU_t1dtJKU6xgLYSiam42L6a7noFvpYyB8juE00P_feoRtYOrwB_tid-fAMey0Wnl8Tfrv_jvfNZRefmHFx4egg_3IwPZoXqBm1K1H-vUHCtYDkWvg4a4NvXkyq-4FRejViOpNYFF6Zq3YsCJbrIR1Zy7nXB3865Kqhenr8NdtD2v2E4-u-WdqxnC7m83g-SkHkvj9V5T8iM4_TL9L2JK9cRO7RtLx1joLkvM_aG=w1214-h910-no',
                  title: 'Flutter Cyberjaya MeetUp #1',
                  date: 'WED, FEB 5, 6:30 PM',
                )
              ],
            ),
          ),
        ));
  }

  void _linksDialog() {
    showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          content: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  child: Text(
                    'Social links',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                _socialLink(
                  FontAwesomeIcons.telegram,
                  const Color(0xff0088cc),
                  'https://t.me/flutterdevmalaysia',
                  'Telegram Group',
                ),
                _socialLink(
                  FontAwesomeIcons.github,
                  const Color(0xff000000),
                  'https://github.com/FlutterMY/meetup',
                  "Meetup's Content",
                ),
                _socialLink(
                  FontAwesomeIcons.github,
                  const Color(0xff000000),
                  'https://github.com/flutter-dev-malaysia/flutter-malaysia-app',
                  'This App',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Future<void> _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Widget _socialLink(IconData icon, Color iconColor, String link, String text) {
  return FlatButton(
    onPressed: () {
      _launchURL(link);
    },
    child: ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: Icon(icon, color: iconColor, size: 28),
      title: Text(text, style: const TextStyle(fontSize: 18)),
    ),
  );
}
