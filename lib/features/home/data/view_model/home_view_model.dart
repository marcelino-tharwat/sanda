import '../model/category.dart';
import '../model/home_assistance_model.dart';
class HomeViewModel {
  // Titles for the sections
  String get categoriesTitle => "Categories";
  String get homeAssistanceTitle => "Home Assistance";

  List<Category> getCategories() {
    return [
      Category(image: "assets/images/homeassistance.jpg", title: "Home Assistance"),
      Category(image: "assets/images/outdoor.jpg", title: "Outdoor"),
      Category(image: "assets/images/personalcare.jpg", title: "Personal care"),
      Category(image: "assets/images/groceries.jpg", title: "Groceries"),
      Category(image: "assets/images/supermarket.jpg", title: "Supermarket"),
      Category(image: "assets/images/pharmacy.jpg", title: "Pharmacy"),
    ];
  }

  List<HomeAssistance> getHomeAssistanceCards() {
    return [
      HomeAssistance(image: "assets/images/mealperparation.jpg", title: "Meal preparation"),
      HomeAssistance(image: "assets/images/nursing.jpg", title: "Nursing"),
      HomeAssistance(image: "assets/images/reading.jpg", title: "Reading"),
      HomeAssistance(image: "assets/images/attendantcare.jpg", title: "Attendant care"),
    ];
  }
}