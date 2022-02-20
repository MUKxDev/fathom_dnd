import 'package:flutter/material.dart';

class Utils {
/* -------------------------------------------------------------------------- */
/*                                   Widgets                                  */
/* -------------------------------------------------------------------------- */
  static SnackBar errorSnackBar(String error) {
    return SnackBar(
      content: Text(error),
      duration: const Duration(seconds: 6),
      backgroundColor: Colors.red.shade300,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
    );
  }

  static SnackBar primarySnackBar(String text, BuildContext context) {
    return SnackBar(
      content: Text(text),
      duration: const Duration(seconds: 6),
      backgroundColor: Theme.of(context).colorScheme.primary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                                   Helpers                                  */
/* -------------------------------------------------------------------------- */

  static List<String> fullMonths = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  static List<String> weekDays = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
  ];

  static String? requiredValidation(String? text) {
    if (text != null) {
      bool _isValid = text.trim() != '';
      if (!_isValid) {
        return 'This field is required';
      }
    }
    return null;
  }

  static String? emailValidation(String? text) {
    if (text != null) {
      bool _isValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(text.trim());
      if (!_isValid) {
        return 'Enter a valid EmailAddress';
      }
    }
    return null;
  }

  static String? passwordValidation(String? text) {
    if (text != null) {
      bool _haveUppercase = RegExp(r"^(?=.*?[A-Z])").hasMatch(text.trim());
      bool _haveLowercase = RegExp(r"^(?=.*?[a-z])").hasMatch(text.trim());
      bool _haveNumber = RegExp(r"^(?=.*?[0-9])").hasMatch(text.trim());
      bool _long8 = RegExp(r"^.{8,}$").hasMatch(text.trim());

      if (!_haveUppercase) {
        return 'must have at least 1 Uppercase letter';
      }
      if (!_haveLowercase) {
        return 'must have at least 1 Lowercase letter';
      }
      if (!_haveNumber) {
        return 'must have at least 1 Number';
      }
      if (!_long8) {
        return 'Password must have at least 8 characters';
      }
    }
    return null;
  }

  static String? confirmPasswordValidation(String? text, String? password) {
    if (text != null) {
      bool _haveUppercase = RegExp(r"^(?=.*?[A-Z])").hasMatch(text.trim());
      bool _haveLowercase = RegExp(r"^(?=.*?[a-z])").hasMatch(text.trim());
      bool _haveNumber = RegExp(r"^(?=.*?[0-9])").hasMatch(text.trim());
      bool _long8 = RegExp(r"^.{8,}$").hasMatch(text.trim());

      if (text.trim() != password?.trim()) {
        return 'passwords must match';
      }
      if (!_haveUppercase) {
        return 'must have at least 1 Uppercase letter';
      }
      if (!_haveLowercase) {
        return 'must have at least 1 Lowercase letter';
      }
      if (!_haveNumber) {
        return 'must have at least 1 Number';
      }
      if (!_long8) {
        return 'Password must have at least 8 characters';
      }
    }
    return null;
  }

/* -------------------------------------------------------------------------- */
/*                               Bool validation                              */
/* -------------------------------------------------------------------------- */
  static bool boolRequiredValidation(String? text) {
    if (text != null) {
      bool _isValid = text.trim() != '';
      return _isValid;
    }
    return false;
  }

  static bool boolEmailValidation(String? text) {
    if (text != null) {
      bool _isValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(text.trim());
      if (!_isValid) {
        return false;
      } else {
        return true;
      }
    } else {
      return false;
    }
  }

  static bool boolPasswordValidation(String? text) {
    if (text != null) {
      bool _haveUppercase = RegExp(r"^(?=.*?[A-Z])").hasMatch(text.trim());
      bool _haveLowercase = RegExp(r"^(?=.*?[a-z])").hasMatch(text.trim());
      bool _haveNumber = RegExp(r"^(?=.*?[0-9])").hasMatch(text.trim());
      bool _long8 = RegExp(r"^.{8,}$").hasMatch(text.trim());

      if (!_haveUppercase || !_haveLowercase || !_haveNumber || !_long8) {
        return false;
      } else {
        return true;
      }
    } else {
      return false;
    }
  }

  static bool boolConfirmPasswordValidation(String? text, String? password) {
    if (text != null) {
      bool _haveUppercase = RegExp(r"^(?=.*?[A-Z])").hasMatch(text.trim());
      bool _haveLowercase = RegExp(r"^(?=.*?[a-z])").hasMatch(text.trim());
      bool _haveNumber = RegExp(r"^(?=.*?[0-9])").hasMatch(text.trim());
      bool _long8 = RegExp(r"^.{8,}$").hasMatch(text.trim());

      if (!_haveUppercase ||
          !_haveLowercase ||
          !_haveNumber ||
          !_long8 ||
          (text.trim() != password?.trim())) {
        return false;
      } else {
        return true;
      }
    } else {
      return false;
    }
  }
}
