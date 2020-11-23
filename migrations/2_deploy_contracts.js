const SAEToken = artifacts.require("SAEToken");

module.exports = function (deployer) {
	deployer.deploy(SAEToken);
};
