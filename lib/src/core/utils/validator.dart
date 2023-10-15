class AppValidator {
  //Name Validator Check
  static String? fullName(
    String? value, {
    String emptymsg = "Name can't be empty",
    String validErrMsg = 'Please Enter Valid Full Name',
  }) {
    // Check if the full name is empty or nots
    if (value!.isEmpty) {
      return emptymsg;
    }
    return null;
  }

  // Empty Field Check
  static String? emptyField(
    String? fieldContent, {
    String? fieldName,
    String emptymsg = "Field can't be empty",
  }) {
    if (fieldName != null) {
      emptymsg = "$fieldName can't be empty";
    }

    // Check if the field content is empty
    if (fieldContent != null && fieldContent.isEmpty) {
      return emptymsg;
    }
    return null;
  }

  static String? age(
    String? value, {
    String emptymsg = "Age can't be empty",
    String invalidMsg = 'Invalid age',
    int upperLimit = 100, // Set the default upper age limit to 100 years
    int alternateUpperLimit = 122, // Set an alternate upper age limit to 122 years
  }) {
    // Check if the age is empty or not
    if (value!.isEmpty) {
      return emptymsg;
    }

    // Check if the entered value is a valid number
    try {
      int age = int.parse(value);

      // Check if age is a positive number and does not exceed the upper limit
      if (age <= 0 || (age > upperLimit && age != alternateUpperLimit)) {
        return invalidMsg;
      }
    } catch (e) {
      // If parsing fails, it's not a valid number
      return invalidMsg;
    }

    return null;
  }
}
