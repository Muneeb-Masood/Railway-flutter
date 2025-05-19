import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class BillScreen extends StatelessWidget {
  final int adults;
  final int infants;
  final int adultFare;
  final int infantFare;
  final double tax;
  final double service;
  final double total;

  const BillScreen({
    Key? key,
    required this.adults,
    required this.infants,
    required this.adultFare,
    required this.infantFare,
    required this.tax,
    required this.service,
    required this.total,
  }) : super(key: key);

// Add this function in your BillScreen class or as a helper
Future<String?> fetchClientSecret(double amount, String currency) async {
  final response = await http.post(
    Uri.parse('http://192.168.56.1:5000/create-payment-intent'), // Use your PC's IP if testing on device
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'amount': amount.toInt(), // Amount in paisa
      'currency': currency,
    }),
  );
  if (response.statusCode == 200) {
    return jsonDecode(response.body)['clientSecret'];
  } else {
    return null;
  }
}

  Future<void> _payWithStripe(BuildContext context) async {
  try {
    // 1. Fetch client secret from backend
    final clientSecret = await fetchClientSecret(total, 'pkr'); // total should be in paisa

    if (clientSecret == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to get payment intent')),
      );
      return;
    }

    // 2. Initialize payment sheet
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        merchantDisplayName: 'Railway App',
        paymentIntentClientSecret: clientSecret,
      ),
    );
    await Stripe.instance.presentPaymentSheet();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Payment successful!')),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Payment failed: $e')),
    );
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FB),
      appBar: AppBar(
        title: const Text("Total Bill"),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Colors.purpleAccent),
              ),
              child: Column(
                children: [
                  const Icon(Icons.info_outline, color: Colors.purple, size: 48),
                  const SizedBox(height: 12),
                  const Text(
                    "Required Payment",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Please review your bill below. Proceed to payment to complete your booking.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _billRow("${adults} x Adult", "Rs ${(adults * adultFare).toStringAsFixed(0)}"),
                  _billRow("${infants} x Infant", "Rs ${(infants * infantFare).toStringAsFixed(0)}"),
                  _billRow("Tax (5%)", "Rs ${tax.toStringAsFixed(0)}"),
                  _billRow("Service", "Rs ${service.toStringAsFixed(0)}"),
                  const Divider(),
                  _billRow(
                    "Total",
                    "Rs ${total.toStringAsFixed(0)}",
                    isBold: true,
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                
                onPressed: () => _payWithStripe(context),

                child: const Text(
                  "Proceed to Payment",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _billRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                color: Colors.grey[700],
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                fontSize: isBold ? 18 : 16,
              ),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              fontSize: isBold ? 18 : 16,
            ),
          ),
        ],
      ),
    );
  }
}