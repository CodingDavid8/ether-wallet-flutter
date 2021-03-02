import 'package:etherwallet/components/AppBarBackButton/app_bar_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';


import '../components/wallet/import_wallet_form.dart';
import '../../context/setup/wallet_setup_provider.dart';
import '../../model/wallet_setup.dart';

class WalletImportPage extends HookWidget {
  WalletImportPage(this.title);

  final String title;

  Widget build(BuildContext context) {
    var store = useWalletSetup(context);
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: AppBarBackButton(
          onTap: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: ImportWalletForm(
        errors: store.state.errors.toList(),
        onImport: !store.state.loading
            ? (type, value) async {
                switch (type) {
                  case WalletImportType.mnemonic:
                    if (!await store.importFromMnemonic(value)) return;
                    break;
                  case WalletImportType.privateKey:
                    if (!await store.importFromPrivateKey(value)) return;
                    break;
                  default:
                    break;
                }
                Navigator.of(context).popAndPushNamed("/");
              }
            : null,
      ),
    );
  }
}
