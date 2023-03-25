# Simple private testnet setup (Babbage era)

This is adapted from the official cardano-node [babbage private testnet scripts](https://github.com/input-output-hk/cardano-node/tree/master/scripts/babbage) and the WoofPool [`cardano-private-testnet-setup`](https://github.com/woofpool/cardano-private-testnet-setup) repo.

It sets up 3 SPO nodes, no further setup for stake pool delegation is performed.

## Usage Instructions

1. **Install Cardano executables**

    * Install the following executables: `cardano-node`, `cardano-cli`, and optionally `cardano-db-sync`
    * Please refer to the [Install executables guide](1-INSTALL_EXECUTABLES.md) for instructions.

2. **Optional: Install PostgreSQL packages and create Postgres user**

    * The `cardano-db-sync` process uses a connection to a PostgreSQL database.
    * Please refer to the [Install posgreSQL](2-INSTALL_POSTGRESQL.md) for instructions to set up.

3. **Run scripts to set up & run private Cardano network**

    * Run scripts to bootstrap the Cardano private network
    * Please refer to the [Run network scripts guide](3-RUN_NETWORK_SCRIPTS.md) for instructions.

4. **Optional: Attach DB Sync process the network**

    * Attach the `cardano-db-sync` process to the network, which syncs blockchain data to a `PostgreSQL` database.
    * Please refer to the [Attach db-sync guide](4-ATTACH_DB_SYNC.md) for instructions.
