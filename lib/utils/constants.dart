class Constants {
  static const API_KEY = "";
  static const String TOP_HEADLINES_URL =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=$API_KEY";

  static String headlinesFor(String country) {
    return "https://newsapi.org/v2/top-headlines?$country=us&apiKey=$API_KEY";
  }

  static const Map<String, String> Countries = {
    "USA": "us",
    "India": "in",
    "Korea": "kr",
    "China": "ch",
  };
}
