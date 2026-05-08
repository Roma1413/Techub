import 'package:drift/drift.dart';

Never _unsupported() {
  throw UnsupportedError('No database implementation found.');
}

DatabaseConnection connect() => _unsupported();