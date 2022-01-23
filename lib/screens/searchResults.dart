import 'package:flutter/material.dart';
import 'package:mnutritionix/models/item.dart';
import 'package:mnutritionix/models/itemAPI.dart';
import 'package:mnutritionix/screens/calculate.dart';
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

  Future<List> getItems(name) async {
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
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : FutureBuilder<void>(
              future: items,
              builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                return ListView.builder(
                  itemCount: _items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _items.length == null
                        ? const Text("No results found")
                        : Card(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                ListTile(
                                  title: Text(_items[index].brandName),
                                  subtitle: Text(_items[index].itemName),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text("Serving size = " + _items[index].servingWeightGrams.toString()),
                                    TextButton(
                                      child: const Text('Calculate'),
                                      onPressed: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                                builder: (_) => Calculate(
                                                      itemName: _items[index].itemName.toString(),
                                                      brandName: _items[index].brandName.toString(),
                                                      servingWeightGrams: _items[index].servingWeightGrams.toString(),
                                                      calories: _items[index].calories.toString(),
                                                      totalFat: _items[index].totalFat.toString(),
                                                      cholesterol: _items[index].cholesterol.toString(),
                                                      sodium: _items[index].sodium.toString(),
                                                      totalCarbohydrates: _items[index].totalCarbohydrates.toString(),
                                                      protein: _items[index].protein.toString(),
                                                    ),
                                        ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                  },
                );
              }),
    );
  }
}
