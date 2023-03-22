
import '../../domain/entities/rating.dart';

class RatingModel extends Rating {
  const RatingModel({
    required super.source,
    required super.value,
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
        source: json["Source"],
        value: json["Value"],
      );
}
