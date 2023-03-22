class ApiConstance {
  static const String baseUrl = "https://www.omdbapi.com/?";
  static const String apiKey = "5f105258";

  static const String searchByName = "${baseUrl}apikey=$apiKey";

  static String movieDetailsByName(String movieName) =>
      "$searchByName&t=$movieName";

 }
