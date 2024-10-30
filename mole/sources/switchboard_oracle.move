module mole::switchboard_oracle {
    use std::type_name;
    use std::type_name::TypeName;
    use std::vector;
    use sui::table::Table;
    use sui::tx_context::TxContext;
    use sui::tx_context;
    use sui::table;
    use sui::transfer;
    use mole::global_storage;
    use mole::global_storage::GlobalStorage;
    use sui::object::UID;
    use sui::object;
    use switchboard_std::aggregator;
    use switchboard_std::aggregator::Aggregator;
    use switchboard_std::math;
    use mole::mole_math;


    struct AggregatorPair has store, drop, copy {
        addr_vec: vector<address>,
        is_single_feed: bool,
        is_reverse: bool
    }

    struct AggregatorStore has store {
        aggregators: Table<TypeName, Table<TypeName, AggregatorPair>>
    }

    struct FeedCap has key, store {
        id: UID,
        oracle: address
    }

    struct AdminCap has key, store {
        id: UID
    }


    public fun is_account_registered(storage: &GlobalStorage, account: address): bool {
        abort 0
    }
    
    public entry fun register(_: &AdminCap, storage: &mut GlobalStorage, ctx: &mut TxContext) {
        abort 0
    }
    
    public entry fun set_price_feed_generic<Coin0, Coin1>(
        admin_cap: &AdminCap,
        feed_cap: &FeedCap,
        storage: &mut GlobalStorage,
        feed0: &Aggregator,
        feed1: &Aggregator,
        is_single_feed: bool,
        is_reverse: bool,
        ctx: &mut TxContext
    ) {
        abort 0
    }

    public fun set_price_feed(
        _: &AdminCap,
        feed_cap: &FeedCap,
        storage: &mut GlobalStorage,
        coin0: TypeName,
        coin1: TypeName,
        feed0: &Aggregator,
        feed1: &Aggregator,
        is_single_feed: bool,
        is_reverse: bool,
        ctx: &mut TxContext
    ) {
        abort 0
    }

    public fun get_price_generic<Coin0, Coin1>(
        storage: &GlobalStorage,
        oracle: address,
        feed0: &Aggregator,
        feed1: &Aggregator
    ): (u64, u64) {
        abort 0
    }

    public fun get_price(
        storage: &GlobalStorage,
        oracle: address,
        coin0: TypeName,
        coin1: TypeName,
        feed0: &Aggregator,
        feed1: &Aggregator
    ): (u64, u64) {
        abort 0    
    }

}
