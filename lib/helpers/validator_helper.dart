/* Variable names index
 -------------------------
emailValidator
requiredValidator 
passwordValidator
urlValidator 
numericValidator
phoneNumberValidator
alphabeticValidator
dateValidator
*/

import 'package:form_validator/form_validator.dart';

// validate an email address, checking both for a valid email format, with proper email domain, and whether it is required.
// email@example.com
final emailValidator = ValidationBuilder()
    .regExp(RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'),
        'Please enter a valid email address')
    .required('Email is required')
    .build();

// checks if the field is empty or not.
final requiredValidator =
    ValidationBuilder().required('This field cannot be empty!').build();

// checks if the password has a minimum length of 8 characters and is also a required field.
final passwordValidator = ValidationBuilder()
    .minLength(8, 'Password must be at least 8 characters long')
    .required('Please enter password.')
    .build();

// Check if the field contains a valid URL. https://www.example.com
final urlValidator = ValidationBuilder()
    .url('Please enter a valid URL')
    .required('URL is required')
    .build();

// checks if the field contains only numerical values.
final numericValidator = ValidationBuilder().add((value) {
  if (value == null || value.isEmpty) {
    // Empty field, so it's considered valid (assuming it's not required)
    return null;
  }

  if (double.tryParse(value) == null) {
    return 'Please enter a valid numeric value';
  }

  return null;
}).build();

//Check if the input is a valid phone number, which takes 09 as starting numbers, and 11 max length
final phoneNumberValidator = ValidationBuilder()
    .maxLength(11, 'Phone number should not exceed 11 digits')
    .add((value) {
  if (value == null || value.isEmpty) {
    // Empty field, so it's considered valid (assuming it's not required)
    return null;
  }
  // A nested if that prioritizes the input to start with 09, then minlength of 11
  if (value.length != 11) {
    if (!value.startsWith("09")) {
      return 'Please enter a valid phone number starting 09';
    }
    return 'Number must be at least 11 digits';
  }
  // Check if the remaining characters are numeric
  final numericValue = value.substring(2);
  if (int.tryParse(numericValue) == null) {
    return 'Please enter a valid phone number';
  }

  return null;
}).build();

// Check if the field contains only alphabetic characters.
final alphabeticValidator = ValidationBuilder().add((value) {
  if (value == null || value.isEmpty) {
    // Empty field, so it's considered valid (assuming it's not required)
    return null;
  }

  const alphabeticRegex = r'^[a-zA-Z]+$';
  final isValid = RegExp(alphabeticRegex).hasMatch(value);
  if (!isValid) {
    return 'Please enter only alphabetic characters';
  }

  return null;
}).build();

// Check if the field contains a valid date in the specified format (yyyy-MM-dd).
final dateValidator = ValidationBuilder().add((value) {
  if (value == null || value.isEmpty) {
    // Empty field, so it's considered valid (assuming it's not required)
    return null;
  }

  const dateFormatRegex = r'^\d{4}-\d{2}-\d{2}$';
  final isValidFormat = RegExp(dateFormatRegex).hasMatch(value);
  if (!isValidFormat) {
    return 'Please enter a valid date in the format yyyy-RMM-dd';
  }

  try {
    final parts = value.split('-');
    final year = int.tryParse(parts[0]);
    final month = int.tryParse(parts[1]);
    final day = int.tryParse(parts[2]);

    if (year == null || month == null || day == null) {
      return 'Please enter a valid date';
    }

    if (month < 1 || month > 12) {
      return 'Please enter a valid month (1-12)';
    }

    if (day < 1 || day > 31) {
      return 'Please enter a valid day (1-31)';
    }
  } catch (e) {
    return 'Please enter a valid date';
  }

  return null;
}).build();

final fullNameValidator = ValidationBuilder().add((value) {
  if (value == null || value.isEmpty) {
    return 'Full name is required';
  }

  final capitalizedValue = value.replaceAllMapped(
    RegExp(r'\b\w'),
    (match) => match.group(0)!.toUpperCase(),
  );

  const fullNameRegex = r'^([A-Z][a-z.]*\s)*[A-Z][a-z.]*$'; // Include . for periods
  final isValid = RegExp(fullNameRegex).hasMatch(capitalizedValue);

  if (!isValid) {
    return 'Please enter a valid full name with each word starting with a capital letter';
  }

  return null;
}).build();
