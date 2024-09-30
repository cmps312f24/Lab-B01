import 'package:flutter/material.dart';

class TipCalculator extends StatefulWidget {
  const TipCalculator({super.key});

  @override
  State<TipCalculator> createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  final TextEditingController _controller = TextEditingController();
  final int _tipPercentage = 0;
  var roundUp = false;

  final tips = [10, 20, 30];
  var billAmount = 0.0;
  var tipAmount = 0.0;
  var _selectedPercentage = 0;

  double _getTipAmount() {
    if (roundUp) return (billAmount * _selectedPercentage / 100).ceilToDouble();
    return (billAmount * _selectedPercentage / 100);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            "Tip Calculator",
            style: TextStyle(
              color: Colors.red,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            onChanged: (value) {
              setState(() {
                billAmount = double.parse(value);
              });
            },
            controller: _controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Bill amount',
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Select Tip Percentage",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(thickness: 5),
          ...tips.map((tip) => RadioListTile<int>(
                title: Text("$tip%"),
                value: tip,
                groupValue: _selectedPercentage,

                //if the value == groupValue then the radio button is selected

                onChanged: (value) {
                  setState(() {
                    _selectedPercentage = value!;
                  });
                },
              )),
          Row(
            children: [
              const SizedBox(width: 20),
              const Text(
                'Round up tip amount',
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(width: 10),
              Switch(
                value: roundUp,
                onChanged: (bool value) {
                  setState(() {
                    roundUp = value;
                  });
                },
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              elevation: 5,
              minimumSize: const Size(200, 50),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            onPressed: () {},
            child: GestureDetector(
              onTap: () {},
              child: SizedBox(
                height: 80,
                child: Center(
                  child: Text(
                    'Total Tip is ${_getTipAmount()}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,

                      //capitalize the text
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
