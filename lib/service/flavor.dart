enum Flavor {
  delivery,
  customer,
  restaurant,
}

class F {
  static Flavor? appFlavor;

  static String get title {
    switch (appFlavor) {
      case Flavor.delivery:
        return 'delivery';
      case Flavor.customer:
        return 'customer';
      case Flavor.restaurant:
        return 'restaurant';
      default:
        return 'mefood';
    }
  }

  static bool get isDelivery {
    return appFlavor == Flavor.delivery;
  }

  static bool get isCustomer {
    return appFlavor == Flavor.customer;
  }

  static bool get isRestaurant {
    return appFlavor == Flavor.restaurant;
  }
}
