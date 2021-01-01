import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

import 'app_config.dart';
import 'service/address_service.dart';
import 'service/configuration_service.dart';
import 'service/contract_service.dart';
import 'utils/contract_parser.dart';

Future<List<SingleChildCloneableWidget>> createProviders(
    AppConfigParams params) async {
  final client = Web3Client(params.web3HttpUrl, Client(), socketConnector: () {
    return IOWebSocketChannel.connect(params.web3RdpUrl).cast<String>();
  });

  final sharedPrefs = await SharedPreferences.getInstance();

  final configurationService = ConfigurationService(sharedPrefs);
  final addressService = AddressService(configurationService);
  final contract =
      await ContractParser.fromAssets('DEUSCoin.json', params.contractAddress);

  // final contractService = ContractService(client, contract);
  final deusContractService = DEUSContractService(client, contract);

  return [
    Provider.value(value: addressService),
    Provider.value(value: deusContractService),
    Provider.value(value: configurationService),
  ];
}
