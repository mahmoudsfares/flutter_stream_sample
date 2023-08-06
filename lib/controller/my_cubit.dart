import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_sample/repo/my_repo.dart';
import 'package:stream_sample/model/animal.dart';

part 'my_state.dart';

class MyCubit extends Cubit<MyState> {
  final MyRepo _repo = MyRepo();

  MyCubit() : super(MyInitial()) {
    _fetchData();
  }

  // TODO: use this for simple apps, the stream subscription is anonymous so it's cancelled when the cubit instance is destroyed
  void _fetchData() async {
    await for (final SealedAnimal data in _repo.fetchData()) {
      switch (data) {
        case Cat():
          emit(MyCat(message: data.message));

        case Dog():
          emit(MyDog(message: data.message, color: data.color));

        case Fish():
          emit(MyFish(messages: data.messages, behavior: data.behavior));
      }
    }
  }

  // TODO: use this approach if you need more control on the stream subscription, it requires manual closure of the subscription
  // StreamSubscription<int>? _subscription;
  //
  // void _fetchData() async {
  //   _subscription = _repo.fetchData().listen((data) {
  //     emit(data);
  //   });
  // }
  //
  // void _cancelSubscription() {
  //   _subscription?.cancel();
  //   _subscription = null;
  // }
  //
  // @override
  // Future<void> close() {
  //   _cancelSubscription();
  //   return super.close();
  // }
}
