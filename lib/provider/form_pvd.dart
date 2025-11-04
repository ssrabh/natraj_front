import 'package:flutter/material.dart';
import 'package:front_flutter/core/data/data_api.dart';
import 'package:front_flutter/core/data/data_model.dart';
import 'package:front_flutter/widgets/utils.dart';

class FormProvider extends ChangeNotifier {
  final DataApi _api = DataApi();

  bool _isLoading = false;
  String? _errorMessage;
  String? _successMessage;
  Map<String, dynamic>? _paymentDetails;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  String? get successMessage => _successMessage;
  Map<String, dynamic>? get paymentDetails => _paymentDetails;

  // ----------------------------------------------------
  // 🧾 Submit Contact Form
  // ----------------------------------------------------
  Future<void> submitForm(BuildContext context, FormDataModel form) async {
    _setLoading(true);

    try {
      final response = await _api.submitForm(form);
      _successMessage = response.message;

      if (context.mounted) {
        Utils.showSuccess(context, _successMessage ?? "Form submitted!");
      }
    } catch (e) {
      _errorMessage = e.toString();
      if (context.mounted) {
        Utils.handleError(context, e, message: "Failed to submit form.");
      }
    } finally {
      _setLoading(false);
    }
  }

  // ----------------------------------------------------
  // 💳 Create Payment Order
  // ----------------------------------------------------
  Future<void> createPayment(
      BuildContext context, PaymentDataModel payment) async {
    _setLoading(true);

    try {
      final response = await _api.createPayment(payment);

      _paymentDetails = {
        "orderId": response.orderId,
        "amount": response.amount,
        "currency": response.currency,
        "keyId": response.keyId,
      };

      _successMessage = response.message;

      if (context.mounted) {
        Utils.showSuccess(
            context, _successMessage ?? "Payment created successfully!");
      }
    } catch (e) {
      _errorMessage = e.toString();
      if (context.mounted) {
        Utils.handleError(context, e,
            message: "Failed to create payment order.");
      }
    } finally {
      _setLoading(false);
    }
  }

  // ----------------------------------------------------
  // 🧹 Reset Methods
  // ----------------------------------------------------
  void resetMessages() {
    _errorMessage = null;
    _successMessage = null;
    notifyListeners();
  }

  void resetState() {
    _isLoading = false;
    _errorMessage = null;
    _successMessage = null;
    _paymentDetails = null;
    notifyListeners();
  }

  // ----------------------------------------------------
  // ⚙️ Private Helper
  // ----------------------------------------------------
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
