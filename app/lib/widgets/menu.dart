import 'package:app/pages/about.dart';
import 'package:app/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class menu extends StatefulWidget {
  @override
  _menuState createState() => _menuState();
}

class _menuState extends State<menu> {
  @override
  Widget build(BuildContext context) {
    Container(
      child: SafeArea(
        child: Drawer(
          child: ListView(
            children: [
              
              UserAccountsDrawerHeader(
                accountName: new Text("Tution App"),
                  accountEmail: null,
                  currentAccountPicture: CircleAvatar(
                    child: Image.asset("assets/images/sad.png"),
                    backgroundColor: Colors.white,
                  ),
                ),
                ListTile(
                title: Text('Home'),
                leading: Icon(Icons.home),
                onTap: () => Navigator.pushReplacementNamed(
                  context,
                  'home',
                ),
              ),
              new Column(
                  children: <Widget>[
                    new ListTile(
                        leading: new Icon(Icons.settings,
                            color: Theme
                                .of(context)
                                .accentColor),
                        title: new Text("Settings"),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context)
                              .push(new MaterialPageRoute(builder: (context) {
                            return new Settings();
                          }));
                        }),
                    new ListTile(
                      leading: new Icon(Icons.info,
                          color: Theme
                              .of(context)
                              .accentColor),
                      title: new Text("About"),
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.push(context,
                            new MaterialPageRoute(builder: (context) {
                              return new About();
                            }));
                      },
                    ),
                    Divider(),
                    new ListTile(
                      leading: Icon(Icons.share,
                          color: Theme
                              .of(context)
                              .accentColor),
                      title: Text("Share"),
                      onTap: () {
                        Share.share(
                            "Hey, checkout this app at https://play.google.com/store/apps/details?id=com.onedreamers.musicplayer");
                        Navigator.of(context).pop();
                      },
                    ),
                    new ListTile(
                      leading: Icon(Icons.star,
                          color: Theme
                              .of(context)
                              .accentColor),
                      title: Text("Rate the app"),
                      onTap: () {
                        Navigator.of(context).pop();

                        launchUrl(
                            "https://play.google.com/store/apps/details?id=com.onedreamers.musicplayer");
                      },
                    ),
                    new ListTile(
                      leading: Icon(Icons.payment,
                          color: Theme
                              .of(context)
                              .accentColor),
                      title: Text("Donate"),
                      onTap: () {
                        Navigator.of(context).pop();
                        launchUrl("http://paypal.me/vinchuli");
                      },
                    )
                  ],
                )
              ],),
          
          ),
        ),
    
    );
  }
  launchUrl(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'could not open';
    }
      
    
  }
}