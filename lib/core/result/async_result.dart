import '../failures/app_failure.dart';
import 'result.dart';

/// A type alias for an asynchronous [Result].
typedef AsyncResult<T> = Future<Result<T, AppFailure>>;
