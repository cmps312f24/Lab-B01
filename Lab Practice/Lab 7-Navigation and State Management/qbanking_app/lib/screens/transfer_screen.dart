import 'package:flutter/material.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  @override
  Widget build(BuildContext context) {
    var transfers = [];
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: ElevatedButton(
              onPressed: () {
                //todo navigate to the  new transfer
              },
              iconAlignment: IconAlignment.start,
              child: const Text('New Transfer')),
        ),
        const Text(
          'Previous Transfers',
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: transfers.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 3,
                child: ListTile(
                  leading: const Icon(
                    Icons.transfer_within_a_station,
                    color: Colors.red,
                  ),
                  title: Text(transfers[index].beneficiaryName),
                  subtitle: Text(transfers[index].beneficiaryAccountNo),
                  leadingAndTrailingTextStyle:
                      const TextStyle(fontSize: 20, color: Colors.green),
                  trailing: GestureDetector(
                      onTap: () {
                        //todo navigate to the  transfers
                        // update the transfer list
                      },
                      child: Text(
                        transfers[index].amount.toString(),
                        style: const TextStyle(fontSize: 20),
                      )),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
