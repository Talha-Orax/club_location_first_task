enum SportType {
  padel,
  tennis,
  squash,
  pickelball,
}

enum CourtSizeType {
  single,
  double,
}

class FilterModel {
  final SportType? sport;
  final CourtSizeType? size;
  final String? price;
  final String? distance;

  FilterModel({
    this.sport,
    this.size,
    this.price,
    this.distance,
  });

// this will be used to convert the filter model to a map of query parameters
  Map<String, String> toQueryParams() {
    Map<String, String> params = {};
    // Add non-null parameters to the map
    if (price != null) {
      params['price'] = price!;
    }
    if (sport != null) {
      params['sport'] = sport!.name;
    }
    if (size != null) {
      params['size'] = size!.name;
    }
    if (distance != null) {
      params['distance'] = distance!;
    }

    return params;
  }
}
