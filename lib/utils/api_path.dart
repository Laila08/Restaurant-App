class ApiPath {
  static String booking() => 'booking/';
  static String countersId(String storeId) => 'counters/$storeId';
  static String bookingDoc(String id) => 'booking/$id';
  static String getCategoryPath() =>
      'https://www.themealdb.com/api/json/v1/1/categories.php';
  static String getMealPath(String mealName) =>
      'https://www.themealdb.com/api/json/v1/1/search.php?s=$mealName';
  static String getMealDetailsPath(String mealId) =>
      'https://www.themealdb.com/api/json/v1/1/lookup.php?i=$mealId';
}
