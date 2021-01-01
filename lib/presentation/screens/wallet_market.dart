import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../context/transfer/wallet_transfer_provider.dart';

class MarketScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final transferStore = useWalletTransfer(context);

    return Scaffold(
      body: Center(
        child: FlatButton(
          child: Text("Buy 100 DEUS"),
          onPressed: () async {
            print("Buying 100 DEUS...");
            await transferStore.buy('100');
            print("Buying process finished.");
          },
        ),
      ),
    );
  }
}
