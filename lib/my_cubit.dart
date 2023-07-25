import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_sample/my_repo.dart';

class MyCubit extends Cubit<int> {

  final MyRepo _repo = MyRepo();

  MyCubit() : super(-1){
    _fetchData();
  }

  // TODO: use this for simple apps, the stream subscription is anonymous so it's cancelled when the cubit instance is destroyed
  void _fetchData() async {
    await for (final int data in _repo.fetchData()) {
      emit(data);
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