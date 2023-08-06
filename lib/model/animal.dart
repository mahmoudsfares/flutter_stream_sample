sealed class SealedAnimal {
  const SealedAnimal();
}

class Cat extends SealedAnimal {
  final String message;
  const Cat({required this.message});
}

class Dog extends SealedAnimal {
  final String message;
  final String color;

  const Dog({required this.message, required this.color});
}

class Fish extends SealedAnimal {
  final List<String> messages;
  final String behavior;

  const Fish({required this.messages, required this.behavior});
}
