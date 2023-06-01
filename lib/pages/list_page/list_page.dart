import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_example/base/base_state.dart';
import 'package:list_example/data/models/item_model.dart';
import 'package:list_example/generated/assets.dart';
import 'package:list_example/pages/list_page/bloc/item_bloc.dart';
import 'package:list_example/pages/list_page/bloc/item_event.dart';
import 'package:list_example/pages/list_page/bloc/item_state.dart';
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
    return BlocConsumer<ItemBloc, BaseState>(
      listenWhen: (context, state) {
        return state is ErrorState || state is ProgressState;
      },
      listener: _onAction,
      buildWhen: (context, state) {
        return state is AddItemState || state is DeleteItemState;
      },
      builder: (context, state) {
        onRebuild(context, state);

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
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
      },
    );
  }

  void _removeLastItem() {
    if (_list.isEmpty) {
      return;
    }

    context.read<ItemBloc>().add(DeleteItemEvent());
  }

  void _addNewItem() {
    context.read<ItemBloc>().add(GetNewItemEvent(_list.length));
  }

  void _onAction(BuildContext context, BaseState state) {
    if (state is ErrorState) {
    } else if (state is ProgressState) {}
  }

  void onRebuild(BuildContext context, BaseState state) {
    if (state is AddItemState) {
      _list.add(state.item ?? ItemModel(name: 'null'));
    } else if (state is DeleteItemState) {
      _list.removeLast();
    }
  }
}
