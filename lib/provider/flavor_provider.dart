enum Flavor {
  delivery,
  customer,
}

class F {
  static Flavor? appFlavor;

  static String get title {
    switch (appFlavor) {
      case Flavor.delivery:
        return 'delivery';
      case Flavor.customer:
        return 'customer';
      default:
        return 'mefood';
    }
  }

  static bool get isDelivery {
    return appFlavor == Flavor.delivery;
  }
}
