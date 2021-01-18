const SAEToken = artifacts.require("SAEToken");
const SAETokenSale = artifacts.require("SAETokenSale");

module.exports = function (deployer) {
	//deployer.deploy(SAEToken, 1000000);
	//deployer.deploy(SAETokenSale);
	deployer.deploy(SAEToken, 1000000).then(function () {
		//token price is 0.001 eth
		var tokenPrice = 1000000000000000;
		return deployer.deploy(SAETokenSale, SAEToken.address, tokenPrice)
	});
};
