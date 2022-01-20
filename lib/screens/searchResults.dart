import 'package:flutter/material.dart';
import 'package:mnutritionix/models/item.dart';
import 'package:mnutritionix/models/itemAPI.dart';
import 'package:mnutritionix/screens/drawer.dart';

class SearchResults extends StatefulWidget {
  final String Name;
  SearchResults({required this.Name});

  @override
  _SearchResultsState createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {

  late List<item> _items;
  bool _isLoading = true;

  Future<List<item>> getItems(name) async {
    _items = await itemAPI.getItem(name);
    setState(() {
      _isLoading = false;
    });
    print(_items);
    print(_items[0].itemName);
    print(_items.length);
    print(widget.Name);
    return _items;
  }

  late Future<void> items;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    items = getItems(widget.Name);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    getItems(widget.Name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(widget.Name.toUpperCase()),
      ),
      endDrawer: mainDrawer(),
      body: FutureBuilder<void>(
        future: items,
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          return ListView.builder(
            itemCount: _items.length,
            itemBuilder: (BuildContext context, int index) {
              return const ListTile(
                title: Text('_items[index].brandName'),
                subtitle: Text('A sufficiently long subtitle warrants three lines.'),
                trailing: Icon(Icons.more_vert),
                isThreeLine: true,
              );
            },
          );
        }
      ),
    );
  }
}
