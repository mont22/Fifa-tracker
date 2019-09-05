import 'package:flutter/material.dart';
import './profile.dart';
import 'dart:ui' as ui;
import '../utils/upload.dart';

class EditProfilePage extends StatefulWidget {
  @override
  EditProfilePageState createState() => new EditProfilePageState();
}

class EditProfilePageState extends State<EditProfilePage> {
      Upload uploadimage=new Upload();
      TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
      String result= "";
      final TextEditingController controller = new TextEditingController();

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
              IconButton(icon: Icon(Icons.notifications), onPressed: (){},),
              IconButton(icon: Icon(Icons.search), onPressed: (){},)
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
                RaisedButton(
                onPressed: uploadimage.choose,
                child: Text('Upload Image', style: new TextStyle(color: Colors.white),),
                color: Colors.red,
              ),
                new SizedBox(height: _height/25.0,),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(padding: new EdgeInsets.only(left: 30),),                    
                    new Text('Montaser Madridista', style: new TextStyle(fontWeight: FontWeight.bold, fontSize: _width/15, color: Colors.white),),
                    new IconButton(icon:Icon(Icons.edit,color: Colors.black), onPressed: (){},)
                  ],
                ),
                new Padding(padding: new EdgeInsets.only(top: _height/30, left: _width/8, right: _width/8),
                  child: new TextField(
                      decoration: new InputDecoration(
                        hintText: "Type in here"
                      ),
                      onSubmitted: (String str) {
                        setState(() {
                         result = str; 
                        });
                        controller.text = "";
                      },
                      controller: controller,
                    ) 
                  ),
                new Divider(height: _height/30,color: Colors.white,),
                new Row(
                  children: <Widget>[
                    rowCell(343, 'Frinds'),
                    rowCell(67, 'Games'),
                    rowCell(40, 'Wins'),
                  ],),
                new Divider(height: _height/30,color: Colors.white),
                new Padding(padding: new EdgeInsets.only(left: _width/8, right: _width/8),
                 child: new  Material(
                         elevation: 5.0,
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.red,
                          child: MaterialButton(
                            minWidth: MediaQuery.of(context).size.width/2,
                            padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                            onPressed: () {
                               Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ProfilePage()),
                              );
                            },
                            child: Text("Save",
                                textAlign: TextAlign.center,
                                style: style.copyWith(
                                    color: Colors.white, fontWeight: FontWeight.bold)),
                          )
                      ),
                 ),
              ],
            ),
          )
      )
    ],);
  }

  Widget rowCell(int count, String type) => new Expanded(child: new Column(children: <Widget>[
    new Text('$count',style: new TextStyle(color: Colors.white),),
    new Text(type,style: new TextStyle(color: Colors.white, fontWeight: FontWeight.normal))
  ],));
}