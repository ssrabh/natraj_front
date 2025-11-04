import 'package:dio/dio.dart';
import 'data_model.dart';

class DataApi {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://natraj-hvo0.onrender.com/api",
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 15),
      headers: {"Content-Type": "application/json"},
    ),
  );

  /// 🔹 Create Razorpay order
  Future<PaymentResponseModel> createPayment(PaymentDataModel payment) async {
    try {
      final response = await _dio.post(
        "/payments/create-order",
        data: payment.toJson(),
      );
      return PaymentResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(_handleError(e));
    }
  }

  /// 🔹 Submit global contact form
  Future<FormResponseModel> submitForm(FormDataModel form) async {
    try {
      final response = await _dio.post(
        "/contact",
        data: form.toJson(),
      );
      return FormResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(_handleError(e));
    }
  }

  /// 🧩 Centralized error handler
  String _handleError(DioException e) {
    if (e.response != null && e.response?.data != null) {
      return e.response?.data["message"] ?? "Server error occurred";
    } else if (e.type == DioExceptionType.connectionTimeout) {
      return "Connection timeout. Please check your internet.";
    } else if (e.type == DioExceptionType.receiveTimeout) {
      return "Server took too long to respond.";
    } else {
      return "Something went wrong. Please try again.";
    }
  }
}
