class CallResult {
  final int status;
  final String statusMessage;
  final dynamic data;
  final String error;
  CallResult({
    required this.status,
    required this.statusMessage,
    required this.data,
    required this.error,
  });
}
