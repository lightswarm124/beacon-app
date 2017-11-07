module.exports = {
    // See <http://truffleframework.com/docs/advanced/configuration>
    // to customize your Truffle configuration!
    rpc: {
        host: "localhost",
        port: 8545
    },
    networks: {
        development: {
            host: "localhost",
            port: 8545,
            network_id: "*", // match any network
            gas: 4712388, // default gas limit
            gasPrice: 100000000000
        }
    }
};
