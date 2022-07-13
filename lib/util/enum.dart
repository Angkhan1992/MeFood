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
  RESTOWNER,
  RESTADMIN,
  RESTUSER,
  DELIVERY,
}

extension MemberType on MEMBERTYPE {
  String get valueString {
    switch (this) {
      case MEMBERTYPE.ADMIN:
        return 'ADMIN';
      case MEMBERTYPE.CUSTOMER:
        return 'CUSTOMER';
      case MEMBERTYPE.RESTADMIN:
        return 'RESTADMIN';
      case MEMBERTYPE.RESTUSER:
        return 'RESTUSER';
      case MEMBERTYPE.RESTOWNER:
        return 'RESTOWNER';
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

  bool equal({
    MEMBERTYPE? type,
    String? typeString,
  }) {
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

enum RESTTYPE {
  OWNER,
  ADMIN,
  USER,
}

extension RestType on RESTTYPE {
  String get valueString {
    switch (this) {
      case RESTTYPE.ADMIN:
        return 'ADMIN';
      case RESTTYPE.OWNER:
        return 'OWNER';
      case RESTTYPE.USER:
        return 'USER';
    }
  }

  RESTTYPE? value(String? valueString) {
    if (valueString == null) {
      return null;
    }
    for (var item in RESTTYPE.values) {
      if (valueString == item.valueString) {
        return item;
      }
    }
    return RESTTYPE.values.first;
  }

  bool equal(RESTTYPE? type, String? typeString) {
    if (type == null && typeString == null) {
      return false;
    }
    var auth = RESTTYPE.values.first;
    if (type == null) {
      auth = value(typeString)!;
    } else {
      auth = type;
    }
    return this == auth;
  }
}

enum GALLERYTYPE {
  LOGO,
  AVATAR,
  IDCARD,
  LICENSE,
  PLATE,
  CAR,
  RESTAURANT,
  PRODUCT,
}

extension GalleryType on GALLERYTYPE {
  String get valueString {
    switch (this) {
      case GALLERYTYPE.LOGO:
        return 'LOGO';
      case GALLERYTYPE.AVATAR:
        return 'AVATAR';
      case GALLERYTYPE.IDCARD:
        return 'IDCARD';
      case GALLERYTYPE.LICENSE:
        return 'LICENSE';
      case GALLERYTYPE.PLATE:
        return 'PLATE';
      case GALLERYTYPE.CAR:
        return 'CAR';
      case GALLERYTYPE.RESTAURANT:
        return 'RESTAURANT';
      case GALLERYTYPE.PRODUCT:
        return 'PRODUCT';
    }
  }

  GALLERYTYPE? value(String? valueString) {
    if (valueString == null) {
      return null;
    }
    for (var item in GALLERYTYPE.values) {
      if (valueString == item.valueString) {
        return item;
      }
    }
    return GALLERYTYPE.values.first;
  }

  bool equal(GALLERYTYPE? type, String? typeString) {
    if (type == null && typeString == null) {
      return false;
    }
    var auth = GALLERYTYPE.values.first;
    if (type == null) {
      auth = value(typeString)!;
    } else {
      auth = type;
    }
    return this == auth;
  }
}

enum ORDERSTATUS {
  PENDING,
  APPLE,
  DELIVERY,
  COMEBACK,
  DONE,
  PROGRESS,
}

extension OrderStatus on ORDERSTATUS {
  String get valueString {
    switch (this) {
      case ORDERSTATUS.PENDING:
        return 'PENDING';
      case ORDERSTATUS.APPLE:
        return 'APPLE';
      case ORDERSTATUS.DELIVERY:
        return 'DELIVERY';
      case ORDERSTATUS.COMEBACK:
        return 'COMEBACK';
      case ORDERSTATUS.DONE:
        return 'DONE';
      case ORDERSTATUS.PROGRESS:
        return 'PROGRESS';
    }
  }

  static ORDERSTATUS? value(String? valueString) {
    if (valueString == null) {
      return null;
    }
    for (var item in ORDERSTATUS.values) {
      if (valueString == item.valueString) {
        return item;
      }
    }
    return ORDERSTATUS.values.first;
  }

  bool equal(ORDERSTATUS? type, String? typeString) {
    if (type == null && typeString == null) {
      return false;
    }
    var auth = ORDERSTATUS.values.first;
    if (type == null) {
      auth = value(typeString)!;
    } else {
      auth = type;
    }
    return this == auth;
  }
}
