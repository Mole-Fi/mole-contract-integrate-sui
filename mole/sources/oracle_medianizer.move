module mole::oracle_medianizer {
    use std::type_name::TypeName;
    use std::vector;
    use std::type_name;
    use sui::table::Table;
    use sui::tx_context::TxContext;
    use sui::tx_context;
    use sui::table;
    use switchboard_std::aggregator::Aggregator;
    use mole::price_oracle;
    use mole::switchboard_oracle;
    use mole::global_storage::GlobalStorage;
    use mole::global_storage;
    use sui::clock::Clock;
    use sui::clock;

    struct OracleSource has store, drop, copy {
        address: address,
        oracle_type: u8
    }

    struct PriceSourceStore has store {
        primary_sources: Table<TypeName, Table<TypeName, vector<OracleSource>>>,
        max_price_deviations: Table<TypeName, Table<TypeName, u64>>,
        max_price_stales: Table<TypeName, Table<TypeName, u64>>
    }

    public entry fun set_primary_sources_generic<Coin0, Coin1>(
        storage: &mut GlobalStorage,
        max_price_deviation: u64,
        max_price_stale: u64,
        sources: vector<address>,
        oracle_types: vector<u8>,
        ctx: &mut TxContext
    ) {
        abort 0
    }

    public fun get_price(
        storage: &GlobalStorage,
        oracle: address,
        token0: TypeName,
        token1: TypeName,
        feed0: &Aggregator,
        feed1: &Aggregator,
        clock: &Clock
    ): (u64, u64) {
        abort 0
    }

    public fun is_account_registered(storage: &GlobalStorage, account: address): bool {
        abort 0
    }

    public fun get_price_generic<Coin0, Coin1>(
        storage: &GlobalStorage, 
        oracle: address, 
        feed0: &Aggregator,
        feed1: &Aggregator,
        clock: &Clock)
        :(u64, u64) 
    {
        abort 0
    }

}
