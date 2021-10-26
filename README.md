# cardano-dbsync-private-network

This project provides instructions and BASH shell scripts to bootstrap a private Cardano network and connect a `cardano-dbsync` process to it. A private Cardano network provides a controlled environment to execute transactions and use SQL queries to view the resulting data.
- The private network consists of three block-producing node processes.
- The `cardano-dbsync` process syncs blockchain data to a highly normalized database schema. This enables blockchain data to be queried with SQL. 
- The scripts used by this project to create the private Cardano network are taken from the `cardano-node` project and have been modified as needed.
    - Please find original script files in the IOHK git repository: [cardano-node/scripts](https://github.com/input-output-hk/cardano-node/tree/master/scripts) 

## Usage Instructions
1. **Install required Cardano executables**

    * Before running shell scripts to bootstrap a private Cardano network, install these executables: `cardano-node`, `cardano-cli`, `cardano-db-sync`, `cardano-db-sync-extended`
    * Please refer to the [Install Executables guide](INSTALL_EXECUTABLES.md) for instructions.

2. **Install PostgreSQL and create database used by db-sync** 

    * The `cardano-db-sync` process uses a connection to a Postgres database.
    * Please refer to the [DB Setup guide](DB_SETUP.md) for instructions to set up.

3. **Use scripts to set up & run private Cardano network and connect DB Sync process**

    * Use scripts to bootstrap the Cardano private network and attach the `cardano-dbsync` process to it to sync blockchain data to SQL database.
    * Please refer to the [Use Scripts guide](USE_SCRIPTS.md) for instructions. 

## Contributors

This project is provided free of charge to the Cardano community. If you want to support its continued development, you can delegate or recommend the Cardano staking pools of our contributors:

- [**WOOF Cardano Staking Pool**](https://woofpool.github.io/)

## Contributing

If you'd like to help maintain this project, please feel free to submit a pull request. Please ensure that any script changes have been tested and verified.

## License

This project is licensed under the terms of the [MIT License](LICENSE).