class APIHelper {
  static const baseUrl = 'http://127.0.0.1:8080';
  static Uri get landing => Uri.parse('$baseUrl/');

  /// POST Method
  /// Creates a new user
  /// Requires firstName , lastName
  static Uri get createUser => Uri.parse('$baseUrl/users/create_user');

  /// POST Method
  /// Creates a new user
  /// Requires firstName , lastName , middleName , username , email , password
  static Uri get signUp => Uri.parse('$baseUrl/auth/signup');

  /// POST Method
  /// For logging in
  /// Requires username , password
  static Uri get signIn => Uri.parse('$baseUrl/auth/signin');

  /// GET Method
  /// For getting posts
  static Uri get getPosts => Uri.parse('$baseUrl/posts/');

  /// POST Method
  /// Creates a new user
  /// Requires firstName , lastName
  static Uri get createPost => Uri.parse('$baseUrl/posts/create_post');
}
