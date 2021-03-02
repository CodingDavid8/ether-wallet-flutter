class AppConfig {
  AppConfig() {
    params['dev'] = AppConfigParams(
        "http://192.168.182.2:7546",
        "ws://192.168.182.2:7546",
        "0x59FFB6Ea7bb59DAa2aC480D862d375F49F73915d");

    params['ropsten'] = AppConfigParams(
        "https://ropsten.infura.io/v3/628074215a2449eb960b4fe9e95feb09",
        "wss://ropsten.infura.io/ws/v3/628074215a2449eb960b4fe9e95feb09",
        "0x5060b60cb8Bd1C94B7ADEF4134555CDa7B45c461");

    ///DEUS Contract: Market-Maker.
    ///https://ropsten.etherscan.io/address/0x8cd408279e966b7e7e1f0b9e5ed8191959d11a19
    ///https://github.com/deusfinance/Automatic-market-maker-AMM/blob/master/AutomaticMarketMaker.sol
    params['deus-ropsten'] = AppConfigParams(
        "https://ropsten.infura.io/v3/cf6ea736e00b4ee4bc43dfdb68f51093",
        "wss://ropsten.infura.io/ws/v3/cf6ea736e00b4ee4bc43dfdb68f51093",
        "0x8cd408279e966b7e7e1f0b9e5ed8191959d11a19");
  }

  Map<String, AppConfigParams> params = Map<String, AppConfigParams>();
}

class AppConfigParams {
  AppConfigParams(this.web3HttpUrl, this.web3RdpUrl, this.contractAddress);
  final String web3RdpUrl;
  final String web3HttpUrl;
  final String contractAddress;
}
