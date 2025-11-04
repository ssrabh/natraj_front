import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utils {
  Utils._(); // Private constructor — prevents instantiation

  // ----------------------------------------------------
  // 🍭 SNACKBAR HELPERS
  // ----------------------------------------------------
  static void showSnackBar(
    BuildContext context,
    String message, {
    Color? backgroundColor,
    Color? textColor,
    Duration duration = const Duration(seconds: 3),
  }) {
    if (!context.mounted) return; // Prevent use after dispose
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: backgroundColor ?? Colors.black87,
          duration: duration,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
  }

  static void showSuccess(BuildContext context, String message) {
    showSnackBar(context, message, backgroundColor: Colors.green[600]);
  }

  static void showError(BuildContext context, String message) {
    showSnackBar(context, message, backgroundColor: Colors.red[600]);
  }

  static void showInfo(BuildContext context, String message) {
    showSnackBar(context, message, backgroundColor: Colors.blue[600]);
  }

  // ----------------------------------------------------
  // ⚠️ ERROR HANDLER
  // ----------------------------------------------------
  static void handleError(BuildContext context, Object error,
      {String? message}) {
    final String errorMsg =
        message ?? "Something went wrong. Please try again.";
    debugPrint("❌ ERROR: $error");
    showError(context, errorMsg);
  }

  // ----------------------------------------------------
  // 📅 DATE FORMATTERS
  // ----------------------------------------------------
  static String formatDate(DateTime date) {
    return DateFormat('dd MMM yyyy').format(date);
  }

  static String formatDateTime(DateTime date) {
    return DateFormat('dd MMM yyyy, hh:mm a').format(date);
  }

  static DateTime? parseDate(String? dateString) {
    if (dateString == null || dateString.isEmpty) return null;
    try {
      return DateTime.parse(dateString);
    } catch (e) {
      debugPrint("❌ Invalid date string: $dateString");
      return null;
    }
  }

  // ----------------------------------------------------
  // 🧭 PAGE NAVIGATION HELPERS
  // ----------------------------------------------------
  static Future<T?> pushPage<T>(
    BuildContext context,
    Widget page, {
    bool fade = false,
  }) {
    if (!context.mounted) return Future.value();
    if (fade) {
      return Navigator.of(context).push<T>(
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => page,
          transitionsBuilder: (_, animation, __, child) => FadeTransition(
            opacity: animation,
            child: child,
          ),
        ),
      );
    } else {
      return Navigator.of(context).push<T>(
        MaterialPageRoute(builder: (_) => page),
      );
    }
  }

  static Future<T?> pushReplacement<T>(
    BuildContext context,
    Widget page, {
    bool fade = false,
  }) {
    if (!context.mounted) return Future.value();
    if (fade) {
      return Navigator.of(context).pushReplacement<T, T>(
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => page,
          transitionsBuilder: (_, animation, __, child) => FadeTransition(
            opacity: animation,
            child: child,
          ),
        ),
      );
    } else {
      return Navigator.of(context).pushReplacement<T, T>(
        MaterialPageRoute(builder: (_) => page),
      );
    }
  }

  static void pop<T>(BuildContext context, [T? result]) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context, result);
    }
  }
}
