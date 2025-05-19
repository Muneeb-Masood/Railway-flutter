import 'package:flutter/material.dart';
import 'package:flutter_railway_app/screens/home/home_model_impl.dart';

class PassengerSheet extends StatefulWidget {
  const PassengerSheet({Key? key}) : super(key: key);

  @override
  State<PassengerSheet> createState() => _PassengerSheetState();
}

class _PassengerSheetState extends State<PassengerSheet> {
  HomeModelImpl get modelImpl => HomeModelImpl();
  int adults = 2;
  int infants = 0;
  int bags = 1;
  String selectedClass = 'Economy';

  Widget _counterRow(String label, IconData icon, int value, VoidCallback onAdd, VoidCallback onRemove) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey[600]),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.remove_circle_outline),
          onPressed: value > 0 ? onRemove : null,
        ),
        Text(
          '$value',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        IconButton(
          icon: const Icon(Icons.add_circle_outline),
          onPressed: onAdd,
        ),
      ],
    );
  }

  Widget _radioRow(String label, String value) {
    return Row(
      children: [
        Radio<String>(
          value: value,
          groupValue: selectedClass,
          onChanged: (val) {
            setState(() {
              selectedClass = val!;
            });
          },
        ),
        Text(label, style: const TextStyle(fontSize: 16)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Passengers", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 12),
            _counterRow(
              "Adults",
              Icons.person,
              adults,
              () => setState(() => adults++),
              () => setState(() => adults--),
            ),
            _counterRow(
              "Infants",
              Icons.child_care,
              infants,
              () => setState(() => infants++),
              () => setState(() => infants--),
            ),
            const SizedBox(height: 18),
            const Text("Bags", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 12),
            _counterRow(
              "Checked Bags",
              Icons.luggage,
              bags,
              () => setState(() => bags++),
              () => setState(() => bags--),
            ),
            const SizedBox(height: 18),
            const Text("Classes", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            _radioRow("Economy", "Economy"),
            _radioRow("Premium Economy", "Premium Economy"),
            _radioRow("Business", "Business"),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A73E8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () { 
                  Map<String , dynamic> data = {
                    'adults': adults,
                    'infants': infants,
                    'bags': bags,
                    'class': selectedClass,
                    
                  };
                  modelImpl.onDetailsCompletion(context , data);},
                child: Text("Done"  , style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white) ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}