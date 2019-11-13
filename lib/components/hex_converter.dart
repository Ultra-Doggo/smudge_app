// This file is used to convert hex strings into integer variables
// so that we can use it with flutter's Color() class

// for example:
// hexConvert takes the argument '#3b3759'
// creates a new string like so: '0xff#3b3759'
// removes any '#' characters
// parses the string and returns the int equivalent

int hexConvert(String hexCode) {
  String newColor = '0xff' + hexCode;
  newColor = newColor.replaceAll('#', '');
  int intColor = int.parse(newColor);
  return intColor;
}