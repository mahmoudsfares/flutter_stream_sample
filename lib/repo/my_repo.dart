import '../model/animal.dart';

class MyRepo {
  Stream<SealedAnimal> fetchData() async* {
    yield const Cat(message: "I'm a cat");
    await Future.delayed(const Duration(seconds: 2));
    yield const Dog(message: "I'm a dog", color: "black");
    await Future.delayed(const Duration(seconds: 2));
    yield const Fish(
        messages: ["I'm a fish", "I'm a young fish"], behavior: "swim");
  }
}
