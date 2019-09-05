
import 'package:flutter/material.dart';

class FriendsListPage extends StatefulWidget {
  @override
  _FriendsListPageState createState() => new _FriendsListPageState();
}

class _FriendsListPageState extends State<FriendsListPage> {
  List _friends = [];

  /*@override
  void initState() {
    super.initState();
    _loadFriends();
  }

  Future<void> _loadFriends() async {
    http.Response response =
        await http.get('https://randomuser.me/api/?results=25');

    setState(() {
      _friends = Friend.allFromResponse(response.body);
    });
  }*/

  Widget _buildFriendListTile(BuildContext context, int index) {
    var friend = _friends[index];

    return new ListTile(
      onTap: () => print("taped"),
      leading: new Hero(
        tag: index,
        child: new CircleAvatar(
          backgroundImage: new NetworkImage(friend.avatar),
        ),
      ),
      title: new Text(friend.name),
      subtitle: new Text(friend.email),
    );
  }

  

  @override
  Widget build(BuildContext context) {
    Widget content;

    if (_friends.isEmpty) {
      content = new Center(
        child: new Text("You don't have any friends", style: new TextStyle(color: Colors.black38, fontSize: 25),),
      );
    } else {
      content = new ListView.builder(
        itemCount: _friends.length,
        itemBuilder: _buildFriendListTile,
      );
    }

    return new Scaffold(
      appBar: new AppBar(
            title: Text("Freinds"),
            elevation: 0.0,
            backgroundColor: Colors.black87,
            actions: <Widget>[
              IconButton(icon: Icon(Icons.notifications), onPressed: (){},),
              IconButton(icon: Icon(Icons.search), onPressed: (){
                print("object");
                showSearch(context: context,delegate: Datasearch());
              },)
            ],
          ),
      body: content,
    );
  }
}

class Datasearch extends SearchDelegate<String> {
  final cities = ['sdfsdf','dfsdfsd','sdfsdf'];
  final recentcities = ['hjhhhj'] ;


  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: (){
      query = "";
    },)];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: (){
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionlist = query.isEmpty ? recentcities : cities.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context,index)=> ListTile(
        leading: Icon(Icons.location_city),
        title: Text(suggestionlist[index]),
        ),
      itemCount: suggestionlist.length,
    );
  }
}