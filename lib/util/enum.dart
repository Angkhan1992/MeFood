enum AUTHTYPE {
  GOOGLE,
  APPLE,
  NORMAL,
  FACEBOOK,
}

extension AuthType on AUTHTYPE {
  String get valueString {
    switch (this) {
      case AUTHTYPE.GOOGLE:
        return 'GOOGLE';
      case AUTHTYPE.APPLE:
        return 'APPLE';
      case AUTHTYPE.NORMAL:
        return 'NORMAL';
      case AUTHTYPE.FACEBOOK:
        return 'FACEBOOK';
    }
  }

  AUTHTYPE? value(String? valueString) {
    if (valueString == null) {
      return null;
    }
    for (var item in AUTHTYPE.values) {
      if (valueString == item.valueString) {
        return item;
      }
    }
    return AUTHTYPE.NORMAL;
  }

  bool equal(AUTHTYPE? type, String? typeString) {
    if (type == null && typeString == null) {
      return false;
    }
    var auth = AUTHTYPE.NORMAL;
    if (type == null) {
      auth = value(typeString)!;
    } else {
      auth = type;
    }
    return this == auth;
  }
}

enum GENDERTYPE {
  MALE,
  FEMALE,
}

extension GenderType on GENDERTYPE {
  String get valueString {
    switch (this) {
      case GENDERTYPE.MALE:
        return 'MALE';
      case GENDERTYPE.FEMALE:
        return 'FEMALE';
    }
  }

  GENDERTYPE? value(String? valueString) {
    if (valueString == null) {
      return null;
    }
    for (var item in GENDERTYPE.values) {
      if (valueString == item.valueString) {
        return item;
      }
    }
    return GENDERTYPE.values.first;
  }

  bool equal(GENDERTYPE? type, String? typeString) {
    if (type == null && typeString == null) {
      return false;
    }
    var auth = GENDERTYPE.values.first;
    if (type == null) {
      auth = value(typeString)!;
    } else {
      auth = type;
    }
    return this == auth;
  }
}

enum MEMBERTYPE {
  ADMIN,
  CUSTOMER,
  RESTAURANT,
  DELIVERY,
}

extension MemberType on MEMBERTYPE {
  String get valueString {
    switch (this) {
      case MEMBERTYPE.ADMIN:
        return 'ADMIN';
      case MEMBERTYPE.CUSTOMER:
        return 'CUSTOMER';
      case MEMBERTYPE.RESTAURANT:
        return 'RESTAURANT';
      case MEMBERTYPE.DELIVERY:
        return 'DELIVERY';
    }
  }

  MEMBERTYPE? value(String? valueString) {
    if (valueString == null) {
      return null;
    }
    for (var item in MEMBERTYPE.values) {
      if (valueString == item.valueString) {
        return item;
      }
    }
    return MEMBERTYPE.values.first;
  }

  bool equal(MEMBERTYPE? type, String? typeString) {
    if (type == null && typeString == null) {
      return false;
    }
    var auth = MEMBERTYPE.values.first;
    if (type == null) {
      auth = value(typeString)!;
    } else {
      auth = type;
    }
    return this == auth;
  }
}

enum ADDRESSTYPE {
  ADMIN,
  CUSTOMER,
  RESTAURANT,
  DELIVERY,
  ORDER,
}

extension AddressType on ADDRESSTYPE {
  String get valueString {
    switch (this) {
      case ADDRESSTYPE.ADMIN:
        return 'ADMIN';
      case ADDRESSTYPE.CUSTOMER:
        return 'CUSTOMER';
      case ADDRESSTYPE.RESTAURANT:
        return 'RESTAURANT';
      case ADDRESSTYPE.DELIVERY:
        return 'DELIVERY';
      case ADDRESSTYPE.ORDER:
        return 'ORDER';
    }
  }

  ADDRESSTYPE? value(String? valueString) {
    if (valueString == null) {
      return null;
    }
    for (var item in ADDRESSTYPE.values) {
      if (valueString == item.valueString) {
        return item;
      }
    }
    return ADDRESSTYPE.values.first;
  }

  bool equal(ADDRESSTYPE? type, String? typeString) {
    if (type == null && typeString == null) {
      return false;
    }
    var auth = ADDRESSTYPE.values.first;
    if (type == null) {
      auth = value(typeString)!;
    } else {
      auth = type;
    }
    return this == auth;
  }
}

enum DELIVERYTYPE {
  CAR,
  TRUCK,
  MOTO,
  WALKER,
}

extension DeliveryType on DELIVERYTYPE {
  String get valueString {
    switch (this) {
      case DELIVERYTYPE.CAR:
        return 'CAR';
      case DELIVERYTYPE.TRUCK:
        return 'TRUCK';
      case DELIVERYTYPE.MOTO:
        return 'MOTO';
      case DELIVERYTYPE.WALKER:
        return 'WALKER';
    }
  }

  DELIVERYTYPE? value(String? valueString) {
    if (valueString == null) {
      return null;
    }
    for (var item in DELIVERYTYPE.values) {
      if (valueString == item.valueString) {
        return item;
      }
    }
    return DELIVERYTYPE.values.first;
  }

  bool equal(DELIVERYTYPE? type, String? typeString) {
    if (type == null && typeString == null) {
      return false;
    }
    var auth = DELIVERYTYPE.values.first;
    if (type == null) {
      auth = value(typeString)!;
    } else {
      auth = type;
    }
    return this == auth;
  }
}

enum RESTAURANTTYPE {
  RESTAURANT,
  BAR,
  COFFEE,
  MARKET,
}

extension RestaurantType on RESTAURANTTYPE {
  String get valueString {
    switch (this) {
      case RESTAURANTTYPE.RESTAURANT:
        return 'RESTAURANT';
      case RESTAURANTTYPE.BAR:
        return 'BAR';
      case RESTAURANTTYPE.COFFEE:
        return 'COFFEE';
      case RESTAURANTTYPE.MARKET:
        return 'MARKET';
    }
  }

  RESTAURANTTYPE? value(String? valueString) {
    if (valueString == null) {
      return null;
    }
    for (var item in RESTAURANTTYPE.values) {
      if (valueString == item.valueString) {
        return item;
      }
    }
    return RESTAURANTTYPE.values.first;
  }

  bool equal(RESTAURANTTYPE? type, String? typeString) {
    if (type == null && typeString == null) {
      return false;
    }
    var auth = RESTAURANTTYPE.values.first;
    if (type == null) {
      auth = value(typeString)!;
    } else {
      auth = type;
    }
    return this == auth;
  }
}