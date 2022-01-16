import 'package:daily_flutter/component/count_view.dart';
import 'package:daily_flutter/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CounterProvider countProvider =
        Provider.of<CounterProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Example"),
      ),
      body: const CountView(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => countProvider.add(),
          ),
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () => countProvider.subtract(),
          ),
        ],
      ),
    );
  }
}
