import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({Key? key}) : super(key: key);

  final TextEditingController cardHolderController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryController = TextEditingController();
  final TextEditingController cvcController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FB),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A73E8),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Payment",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          Container(
            margin: const EdgeInsets.all(16),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Outbound
                Row(
                  children: [
                    const Text(
                      "HAN",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(width: 4),
                    const Text("Hanoi"),
                    const Spacer(),
                    const Text(
                      "SIN",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(width: 4),
                    const Text("Singapore"),
                  ],
                ),
                Row(
                  children: [
                    const Text("Mar 20, 9:35"),
                    const Spacer(),
                    const Text("Mar 20, 17:35"),
                  ],
                ),
                Row(
                  children: [
                    const Text("1 stop"),
                    const Spacer(),
                    const Text("12h30m"),
                    const Spacer(),
                    const Text("Economy"),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/2/2d/VietJet_Air_logo.png',
                      width: 32,
                      height: 32,
                      errorBuilder: (context, error, stackTrace) => Icon(Icons.flight, size: 32, color: Colors.grey),
                    ),
                    const SizedBox(width: 8),
                    const Text("Vietjet Air   Airbus 320"),
                  ],
                ),
                const Divider(height: 24),
                // Return
                Row(
                  children: [
                    const Text(
                      "SIN",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(width: 4),
                    const Text("Hanoi"),
                    const Spacer(),
                    const Text(
                      "HAN",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(width: 4),
                    const Text("Singapore"),
                  ],
                ),
                Row(
                  children: [
                    const Text("Mar 25, 9:35"),
                    const Spacer(),
                    const Text("Mar 25, 17:35"),
                  ],
                ),
                Row(
                  children: [
                    const Text("1 stop"),
                    const Spacer(),
                    const Text("12h30m"),
                    const Spacer(),
                    const Text("Economy"),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/2/2d/VietJet_Air_logo.png',
                      width: 32,
                      height: 32,
                      errorBuilder: (context, error, stackTrace) => Icon(Icons.flight, size: 32, color: Colors.grey),
                    ),
                    const SizedBox(width: 8),
                    const Text("Vietjet Air   Airbus 320"),
                  ],
                ),
                const Divider(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      "Total: ",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      "\$112",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color(0xFF1A73E8),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Credit Card Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Credit card",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: cardHolderController,
                  decoration: const InputDecoration(
                    labelText: "Card Holder",
                    hintText: "eg. NGUYEN TIEN LINH",
                    border: InputBorder.none,
                  ),
                ),
                Divider(),
                TextField(
                  controller: cardNumberController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Card Number",
                    hintText: "0000 - 0000 - 0000 - 0000",
                    border: InputBorder.none,
                  ),
                ),
                Divider(),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: expiryController,
                        keyboardType: TextInputType.datetime,
                        decoration: const InputDecoration(
                          labelText: "Expiry date",
                          hintText: "mm / yy",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: cvcController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: "CVC",
                          hintText: "--",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    "Your card is secured by Stripe. We do not store your credit card information.",
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Color(0xFFE0E0E0))),
        ),
        child: Row(
          children: [
            const Text(
              "\$112",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(width: 8),
            const Text(
              "Total (1 adult)",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const Spacer(),
            SizedBox(
              height: 44,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                ),
                onPressed: () {
                  // Payment logic here
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Payment processed!')),
                  );
                },
                child: const Text(
                  "Pay now",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}