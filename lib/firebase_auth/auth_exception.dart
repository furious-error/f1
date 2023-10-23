
//Login Exceptions
class UserNotFoundAuthException implements Exception{}

class WrongPasswordAuthException implements Exception{}

// Register Excetions
class WeakPasswordAuthException implements Exception{}

class EmailAlreadyInUseAuthException implements Exception{}

class InvalidEmailAuthException implements Exception{}

// Generic Excetions
class GenericAuthExceptions implements Exception{}

class UserNotLoggedInAuthException implements Exception{}