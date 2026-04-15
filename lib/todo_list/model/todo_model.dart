class Todo{
  final String name;
  final DateTime createAt;

Todo({
    required this.name,
  required this.createAt,
});

@override
  String toString() =>'Todo(name: $name, createAt: $createAt)';

}