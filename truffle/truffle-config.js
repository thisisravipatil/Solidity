var HDWalletProvider = require("truffle-hdwallet-provider");
var mnemonic = "orange apple banana ... ";
module.exports = {
 networks: {
  development: {
   host: "127.0.0.1",
   port: 8545,
   network_id: "*"
  },
  rinkeby: {
      provider: function() { 
       return new HDWalletProvider(mnemonic, "https://rinkeby.infura.io/v3/0xe3fd373d6398912190df78ebc8fe840cc8ee9c48");
      },
      network_id: 4,
      gas: 4500000,
      gasPrice: 10000000000,
  }
 }
};
