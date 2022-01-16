import 'package:daily_flutter/provider/counter_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CountView extends StatelessWidget {
  const CountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        /// Provider: 구독된 모든 위젯에서 변경된 값을 알고 싶을 때
        Provider.of<CounterProvider>(context, listen: true).count.toString(),
      ),
    );

    /// Consumer: 단독으로 상태 변경을 알고 싶을때
    // return Center(
    //   child: Consumer<CounterProvider>(builder: (context, provider, child) {
    //     return Text(
    //       provider.count.toString(),
    //     );
    //   }),
    // );
  }
}
