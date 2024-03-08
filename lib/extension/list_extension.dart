import '../utils/utils.dart';

extension WidgetExtensions on List<num> {
  EdgeInsets get pad {
    assert(length <= 4, 'Length cannot be more than 4');
    assert(length != 3, 'Length cannot be 3');
    if (length == 1) {
      return EdgeInsets.symmetric(
        horizontal: this[0].toDouble(),
      );
    } else if (length == 4) {
      return EdgeInsets.only(
        left: this[0].toDouble(),
        top: this[1].toDouble(),
        right: this[2].toDouble(),
        bottom: this[3].toDouble(),
      );
    }
    return EdgeInsets.symmetric(
      horizontal: this[0].toDouble(),
      vertical: this[1].toDouble(),
    );
  }

  double get getMax {
    return reduce((value, element) => value > element ? value : element)
        .toDouble();
  }
}

extension ConcatenateListExtension on List<String> {
  String concatenateList() {
    if (isEmpty) {
      return ''; // Handle empty list
    } else if (length == 1) {
      return this[0]; // Handle single-item list
    } else {
      String joinedItems = sublist(0, length - 1).join(', ');
      return '$joinedItems, and $last';
    }
  }
}
