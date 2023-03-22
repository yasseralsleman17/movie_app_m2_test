import 'package:equatable/equatable.dart';

class Rating extends Equatable {
  final String source;
  final String value;

  const Rating({
    required this.source,
    required this.value,
  });

  @override
  List<Object> get props => [source, value];
}
