class PaymentResponse {
  final bool requirePayment;
  final String? paymentUrl;
  final String message;

  const PaymentResponse({required this.requirePayment, required this.paymentUrl, required this.message});

  factory PaymentResponse.fromJson(Map<String, dynamic> json) => PaymentResponse(
        requirePayment: json['requirePayment'] as bool,
        paymentUrl: json['paymentUrl'],
        message: json['message'],
      );

  Map<String, dynamic> toJson() => {'requirePayment': requirePayment, 'paymentUrl': paymentUrl, 'message': message};
}
