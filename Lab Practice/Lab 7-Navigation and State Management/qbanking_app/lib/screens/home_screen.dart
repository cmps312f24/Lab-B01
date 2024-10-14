import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> _menuItems = [
    {
      'label': 'Withdraw',
      'icon': Icons.account_balance,
      // 'route': AppRouter.account.name,
    },
    {
      'label': 'Deposits',
      'icon': Icons.account_balance_wallet,
      // 'route': AppRouter.deposit.name,
      'params': {'accountNo': '123456'},
    },
    {
      'label': 'Transfers',
      'icon': Icons.transfer_within_a_station,
      // 'route': AppRouter.transfer.name,
    },
    {
      'label': 'Transactions',
      'icon': Icons.account_balance_wallet,
      // 'route': AppRouter.transactions.name,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/banner.jpg'),
          Expanded(
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              children: [
                for (var item in _menuItems)
                  GestureDetector(
                    onTap: () {
                      //todo navigate to the route
                      // context.go(item['route']);
                      // update the title
                    },
                    child: Card(
                      elevation: 5,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(item['icon']),
                            Text(
                              item['label'],
                              style: const TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
