import 'package:flutter/material.dart';
import 'package:list_example/data/models/item_model.dart';
import 'package:list_example/generated/assets.dart';
import 'package:list_example/pages/list_page/widgets/item_widget.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final _list = <ItemModel>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List example'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  kToolbarHeight,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                Image.asset(
                  Assets.logo,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _list.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 2,
                  ),
                  itemBuilder: (context, index) {
                    return ItemWidget(
                      item: _list[index],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _addNewItem,
            backgroundColor: Colors.green,
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: _removeLastItem,
            backgroundColor: Colors.red,
            child: const Icon(Icons.delete),
          )
        ],
      ),
    );
  }

  void _removeLastItem() {
    _list.removeLast();
    setState(() {});
  }

  void _addNewItem() {
    _list.add(
      ItemModel(name: 'qwqwqqq'),
    );
    setState(() {});
  }
}
