abstract class Enum<T> {
  final T value;
  const Enum(this.value);

  String toString() {
    return "${runtimeType.toString()}. ${value == null ? 'null' : value.toString()}";
  }
}
