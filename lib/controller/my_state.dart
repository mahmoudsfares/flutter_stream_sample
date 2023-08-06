part of 'my_cubit.dart';

@immutable
abstract class MyState extends Equatable {
  const MyState();

  @override
  List<Object> get props => [];
}

class MyInitial extends MyState {}

class MyCat extends MyState {
  final String message;

  const MyCat({required this.message});

  @override
  List<Object> get props => [message];
}

class MyDog extends MyState {
  final String message;
  final String color;

  const MyDog({required this.message, required this.color});

  @override
  List<Object> get props => [message, color];
}

class MyFish extends MyState {
  final List<String> messages;
  final String behavior;

  const MyFish({required this.messages, required this.behavior});

  @override
  List<Object> get props => [messages];
}
