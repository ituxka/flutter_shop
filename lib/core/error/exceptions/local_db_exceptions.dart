class LocalDBException implements Exception {}

class CouldNotSaveToLocalDBException extends LocalDBException {}

class NoEntityException extends LocalDBException {}
