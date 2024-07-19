List<String> personal = ["3 Months","15% Discount","Rs. 8920","6 Months","20% Discount","Rs. 16800","12 Months","25% Discount","Rs. 31500"];
List<String> general = ["3 Months","15% Discount","Rs. 8920","6 Months","20% Discount","Rs. 16800","12 Months","25% Discount","Rs. 31500"];
String steambath = "Steambathing, also known as steam therapy or steam baths, involves exposing oneself to heated steam for therapeutic purposes.";
String bmi = "BMI, or Body Mass Index, is a widely used measurement that helps assess a person's body weight in relation to their height. It provides a numerical indicator of whether an individual is underweight, normal weight, overweight, or obese based on their BMI score. This tool is valuable for quickly evaluating health risks associated with weight and is calculated using a simple formula involving weight and height.";
String subtext = "Empower yourself with our\nexpert-led workouts\nAnd state-of-the-art equipment at";

// RegExp email = RegExp("^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,4}\$");
RegExp email = RegExp("^[a-zA-Z0-9.-]{2,6}\$");
RegExp nameregex = RegExp("^([a-z])*[a-z\\s]+\$");
RegExp phoneregex = RegExp("^[0-9]{10}\$");

// It contains at least 8 characters and at most 20 characters.
// It contains at least one digit.
// It contains at least one upper case alphabet.
// It contains at least one lower case alphabet.
// It contains at least one special character which includes !@#$%&*()-+=^.
// It doesn’t contain any white space.
RegExp passregex = RegExp("^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#\$%^&-+=()])(?=\\S+\$){5, 20}\$");

String smsapikey = "He/nUw79+kA-teIN41tduCpdN7vrR1RPHrpVxHdOiF";

String loginapi = "http://10.10.1.96/api/Users/login";
String otpapi = "https://api.textlocal.in/send/";
String otpmessage = "MOBEDS: One-time-Password (OTP) to access the MOBEDS Recruitment Portal is 867796 valid till 10 mins. CubeTen technologies";