class PaymentDataModel {
  final String email;
  final double amount;
  final String phoneNumber;
  final String notes;

  PaymentDataModel({
    required this.email,
    required this.amount,
    required this.phoneNumber,
    required this.notes,
  });

  Map<String, dynamic> toJson() => {
        "email": email,
        "amount": amount,
        "phoneNumber": phoneNumber,
        "notes": notes,
      };
}

class PaymentResponseModel {
  final String message;
  final String orderId;
  final String currency;
  final int amount;
  final String keyId;

  PaymentResponseModel({
    required this.message,
    required this.orderId,
    required this.currency,
    required this.amount,
    required this.keyId,
  });

  factory PaymentResponseModel.fromJson(Map<String, dynamic> json) {
    return PaymentResponseModel(
      message: json["message"] ?? "",
      orderId: json["orderId"] ?? "",
      currency: json["currency"] ?? "",
      amount: json["amount"] ?? 0,
      keyId: json["keyId"] ?? "",
    );
  }
}

class FormDataModel {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneCountry;
  final String phoneNumber;
  final String designation;
  final String companyName;
  final String queryType;
  final String message;

  FormDataModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneCountry,
    required this.phoneNumber,
    required this.designation,
    required this.companyName,
    required this.queryType,
    required this.message,
  });

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phoneCountry": phoneCountry,
        "phoneNumber": phoneNumber,
        "designation": designation,
        "companyName": companyName,
        "queryType": queryType,
        "message": message,
      };
}

class FormResponseModel {
  final String message;

  FormResponseModel({required this.message});

  factory FormResponseModel.fromJson(Map<String, dynamic> json) {
    return FormResponseModel(message: json["message"] ?? "");
  }
}
