import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_sample/controller/my_cubit.dart';

import 'bloc_observer.dart';

void main() {
  Bloc.observer = const AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => MyCubit(),
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<MyCubit, MyState>(
          builder: (context, state) {
            switch (state) {
              case MyCat():
                return Text(state.message);
              case MyDog():
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.message),
                    const SizedBox(height: 5),
                    Text(state.color),
                  ],
                );
              case MyFish():
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(
                      state.messages.length,
                      (index) => Text(state.messages[index]),
                    ),
                    const SizedBox(height: 5),
                    Text(state.behavior),
                  ],
                );
              case MyInitial():
                return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
