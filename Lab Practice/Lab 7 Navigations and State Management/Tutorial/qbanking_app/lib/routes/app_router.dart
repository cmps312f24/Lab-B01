import 'package:go_router/go_router.dart';
import 'package:qbanking_app/screens/account_screen.dart';
import 'package:qbanking_app/screens/deposit_screen.dart';
import 'package:qbanking_app/screens/home_screen.dart';
import 'package:qbanking_app/screens/shell_screen.dart';
import 'package:qbanking_app/screens/transfer_screen.dart';

class AppRouter {
  static const home = (name: 'home:id', path: '/');
  static const account = (name: 'account', path: 'account');
  static const deposit = (name: 'deposit', path: 'deposit:accountNo');
  static const transaction = (name: 'transaction', path: 'transaction');
  static const transfer = (name: 'transfer', path: 'transfer');

  // router

  static final GoRouter router = GoRouter(
    initialLocation: home.path,
    routes: [
      ShellRoute(
        routes: [
          GoRoute(
            name: home.name,
            path: home.path,
            builder: (context, state) => const HomeScreen(),
            routes: [
              GoRoute(
                name: account.name,
                path: account.path,
                builder: (context, state) => const AccountScreen(),
              ),
              GoRoute(
                name: deposit.name,
                path: deposit.path,
                builder: (context, state) {
                  final accountNo = state.pathParameters['accountNo'] ?? '';
                  return DepositScreen(accountNo: accountNo);
                },
              ),
              GoRoute(
                name: transfer.name,
                path: transfer.path,
                builder: (context, state) => const TransferScreen(),
              ),
            ],
          ),
        ],
        builder: (context, state, child) => ShellScreen(child: child),
      ),
    ],
  );
}
