import '../model/category.dart';
import '../model/home_assistance_model.dart';
class HomeViewModel {
  // Titles for the sections
  String get categoriesTitle => "Categories";
  String get homeAssistanceTitle => "Home Assistance";

  List<Category> getCategories() {
    return [
      Category(image: "assets/images/HomeAssistanceIcon.JPG", title: "Home Assistance"),
      Category(image: "assets/images/OutdoorIcon.JPG", title: "Outdoor"),
      Category(image: "assets/images/PersonalCareIcon.JPG", title: "Personal Care"),
      Category(image: "assets/images/HyperMarketIcon.JPG", title: "Hyper Market"),
      Category(image: "assets/images/DonorsIcon.JPG", title: "Donor"),
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