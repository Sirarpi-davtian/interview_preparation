import 'dart:developer';

void main() {
  assert(isPalindrome("abcba"));
  assert(isPalindrome("a"));
  assert(isPalindrome(""));
  assert(isPalindrome("abbcba") == false);

  // runApp(const MyApp());
}

bool isPalindrome(String string) {
  if (string.length <= 1) {
    log('true');
    return true;
  }

  for (int i = 0, limit = string.length ~/ 2; i <= limit; ++i) {
    if (string[i] != string[string.length - 1 - i]) {
      log('false');

      return false;
    }
  }
  return true;
}
