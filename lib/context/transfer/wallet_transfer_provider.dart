import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

import '../../model/wallet_transfer.dart';
import '../../service/configuration_service.dart';
import '../../service/contract_service.dart';
import '../hook_provider.dart';
import 'wallet_transfer_handler.dart';
import 'wallet_transfer_state.dart';

class WalletTransferProvider
    extends ContextProviderWidget<WalletTransferHandler> {
  WalletTransferProvider(
      {Widget child, HookWidgetBuilder<WalletTransferHandler> builder})
      : super(child: child, builder: builder);

  @override
  Widget build(BuildContext context) {
    final store = useReducer<WalletTransfer, WalletTransferAction>(reducer,
        initialState: WalletTransfer());

    final contractService = Provider.of<DEUSContractService>(context);
    final configurationService = Provider.of<ConfigurationService>(context);
    final handler = useMemoized(
      () => WalletTransferHandler(store, contractService, configurationService),
      [contractService, store],
    );

    return provide(context, handler);
  }
}

WalletTransferHandler useWalletTransfer(BuildContext context) {
  var handler = Provider.of<WalletTransferHandler>(context);

  return handler;
}
