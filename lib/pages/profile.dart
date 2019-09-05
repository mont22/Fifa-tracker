import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import './friends.dart';
import './edit.dart';

class ProfilePage extends StatefulWidget {
  @override
  ProfilePageState createState() => new ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    final String imgUrl = 'https://pixel.nymag.com/imgs/daily/selectall/2017/12/26/26-eric-schmidt.w700.h700.jpg';

    return new Stack(children: <Widget>[
      new Container(color: Colors.blue,),
      new Image.network(imgUrl, fit: BoxFit.fill,),
      new BackdropFilter(
      filter: new ui.ImageFilter.blur(
      sigmaX: 6.0,
      sigmaY: 6.0,
      ),
      child: new Container(
      decoration: BoxDecoration(
      color:  Colors.teal.withOpacity(0.9),
      ),)),
      new Scaffold(
          appBar: new AppBar(
            title: Text("Profile"),
            elevation: 0.0,
            backgroundColor: Colors.black54,
            actions: <Widget>[
              IconButton(icon: Icon(Icons.notifications_none), onPressed: (){
                print("taaaaped");
              },),
              IconButton(icon: Icon(Icons.search), onPressed: (){})
            ],
          ),
          drawer: new Drawer(
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: <Widget>[
                  new UserAccountsDrawerHeader(
                    accountName: new Text("Montaser Madridista"),
                    accountEmail: new Text("montaserhelmy@gmail.com"),
                    currentAccountPicture: new CircleAvatar(
                      backgroundColor: Colors.redAccent,
                      backgroundImage: NetworkImage(imgUrl),
                    ),
                    otherAccountsPictures: <Widget>[
                       new CircleAvatar(
                      backgroundColor: Colors.redAccent,
                      backgroundImage: NetworkImage('https://answers.ea.com/ea/attachments/ea/fifa-19-technical-issues-en/1472/1/FIFA.png'),
                      )
                    ],
                  ),
                  ListTile(
                    title: Text('Edit your profile', style: new TextStyle(fontSize: 20, fontWeight: FontWeight.normal),),
                    trailing: new Icon(Icons.edit),
                    onTap: () {

                    },
                  ),
                  ListTile(
                    title: Text('Search for friends',style: new TextStyle(fontSize: 20, fontWeight: FontWeight.normal),),
                    trailing: new Icon(Icons.search),
                    onTap: () {

                    },
                  ),
                  ListTile(
                    title: Text('Dashboard',style: new TextStyle(fontSize: 20, fontWeight: FontWeight.normal),),
                    trailing: new Icon(Icons.dashboard),
                    onTap: () {

                    },
                  ),
                  ListTile(
                    title: Text('Log out',style: new TextStyle(fontSize: 20, fontWeight: FontWeight.normal),),
                    trailing: new Icon(Icons.exit_to_app),
                    onTap: () {

                    },
                  ),
                ],
              ),
          ),
          backgroundColor: Colors.transparent,
          body: new Center(
            child: new Column(
              children: <Widget>[
                new SizedBox(height: _height/12,),
                new CircleAvatar(radius:_width<_height? _width/4:_height/4,backgroundImage: NetworkImage(imgUrl),),
                new SizedBox(height: _height/25.0,),
                new Text('Eric Schmidt', style: new TextStyle(fontWeight: FontWeight.bold, fontSize: _width/15, color: Colors.white),),
                new Padding(padding: new EdgeInsets.only(top: _height/30, left: _width/8, right: _width/8),
                  child:new Text('Snowboarder, Superhero and writer.\nSometime I work at google as Executive Chairman ',
                    style: new TextStyle(fontWeight: FontWeight.normal, fontSize: _width/25,color: Colors.white),textAlign: TextAlign.center,) ,),
                new Divider(height: _height/30,color: Colors.white,),
                new Row(
                  children: <Widget>[
                    rowCell(343, 'Frinds'),
                    rowCell(67, 'Games'),
                    rowCell(40, 'Wins'),
                  ],),
                new Divider(height: _height/30,color: Colors.white),
                new Padding(padding: new EdgeInsets.only(left: _width/8, right: _width/8),
                 child: new RaisedButton(onPressed: (){
                   Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => FriendsListPage()),
                              );
                 },
                  child: new Container(child: new Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
                    new Icon(Icons.person),
                    new SizedBox(width: _width/30,),
                    new Text('Frinds')
                  ],)),color: Colors.blue[50],),),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.edit),
            backgroundColor: Colors.red,
            onPressed: (){
              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => EditProfilePage()),
                              );
            },
          ),
      )
    ],);
  }

  Widget rowCell(int count, String type) => new Expanded(child: new Column(children: <Widget>[
    new Text('$count',style: new TextStyle(color: Colors.white),),
    new Text(type,style: new TextStyle(color: Colors.white, fontWeight: FontWeight.normal))
  ],));
}