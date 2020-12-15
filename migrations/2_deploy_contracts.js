const SAEToken = artifacts.require("SAEToken");

module.exports = function (deployer) {
	deployer.deploy(SAEToken, 1000000);
};
