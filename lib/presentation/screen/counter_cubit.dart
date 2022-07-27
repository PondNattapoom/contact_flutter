import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/logic/index.dart';

class CounterDemo extends StatefulWidget {
  static const String id = 'CounterDemo';
  const CounterDemo({Key? key}) : super(key: key);

  @override
  State<CounterDemo> createState() => _CounterDemoState();
}

class _CounterDemoState extends State<CounterDemo> {
  var _stateCounter = 0;

  void _increaseStateCounter() {
    setState(() {
      _stateCounter++;
    });
  }

  void _decreaseStateCounter() {
    setState(() {
      _stateCounter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    context.read<CounterCubit>().funcGetCounter();

    return Scaffold(
      drawerEnableOpenDragGesture: true,
      appBar: AppBar(
        title: const Text('Cubit functions & Events'),
        leading: IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: const Text("Go back to Dashboard"),
                content: const Text('Do you want to go back?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: const Text('Yes'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: const Text('No'),
                  )
                ],
              ),
            );
          },
          icon: const Icon(Icons.dashboard, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BlocBuilder<CounterCubit, CounterState>(
                      buildWhen: (previous, current) =>
                          current is EventGetCounter,
                      builder: (context, state) {
                        print(state);
                        if (state is EventGetCounter) {
                          print(state);
                          var cubitCounter = (state.counter).toString();
                          return Text('Cubit counter: $cubitCounter');
                        }
                        return const Text("No Emit event found!!!");
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<CounterCubit>().funcIncreaseCounter(1);
                      },
                      child: const Text('Increase Counter +'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<CounterCubit>().funcDecreaseCounter(1);
                      },
                      child: const Text('Decrease Counter -'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('State Counter: $_stateCounter'),
                    ElevatedButton(
                      onPressed: () => {
                        _increaseStateCounter(),
                      },
                      child: const Text('Increase state value by +1'),
                    ),
                    ElevatedButton(
                      onPressed: () => {
                        _decreaseStateCounter(),
                      },
                      child: const Text('Decrease state value by -1'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
