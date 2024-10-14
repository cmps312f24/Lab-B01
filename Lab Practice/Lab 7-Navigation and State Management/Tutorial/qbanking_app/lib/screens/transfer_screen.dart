import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:qbanking_app/providers/transfer_provider.dart';
import 'package:qbanking_app/routes/app_router.dart';
import 'package:qbanking_app/screens/shell_screen.dart';

class TransferScreen extends ConsumerStatefulWidget {
  const TransferScreen({super.key});

  @override
  ConsumerState<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends ConsumerState<TransferScreen> {
  @override
  Widget build(BuildContext context) {
    var transfers = ref.watch(transferNotifierProvider);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: ElevatedButton(
              onPressed: () {
                context.pushNamed(AppRouter.newTransfer.name);
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
