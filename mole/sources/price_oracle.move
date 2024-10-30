// oracle by manually

module mole::price_oracle {
    use std::type_name;
    use std::type_name::TypeName;
    use sui::table::Table;
    use sui::tx_context::TxContext;
    use sui::tx_context;
    use sui::table;
    use sui::transfer;
    use mole::global_storage;
    use mole::global_storage::GlobalStorage;
    use sui::object::UID;
    use sui::object;
    use sui::clock::Clock;
    use sui::clock;

    struct PriceStore has store {
        prices: Table<TypeName, Table<TypeName, PriceData>>
    }

    struct PriceData has store, drop, copy {
        price: u64,
        last_update: u64,
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

    public entry fun set_price_generic<Coin0, Coin1>(
        admin_cap: &AdminCap,
        feed_cap: &FeedCap,
        storage: &mut GlobalStorage,
        price: u64,
        clock: &Clock,
        ctx: &mut TxContext
    ) {
        abort 0
    }

    public fun get_price(
        storage: &GlobalStorage,
        oracle: address,
        coin0: TypeName,
        coin1: TypeName
    ): (u64, u64) {
        abort 0
    }

    public fun get_price_generic<Coin0, Coin1>(
        storage: &GlobalStorage,
        oracle: address
    ): (u64, u64) {
        abort 0
    }

    public fun set_price(
        admin_cap: &AdminCap,
        feed_cap: &FeedCap,
        storage: &mut GlobalStorage,
        coin0: TypeName,
        coin1: TypeName,
        price: u64,
        clock: &Clock,
        ctx: &mut TxContext
    ) {
        abort 0
    }

    public fun set_price_with_cap(
        _: &AdminCap,
        feed_cap: &FeedCap,
        storage: &mut GlobalStorage,
        coin0: TypeName,
        coin1: TypeName,
        price: u64,
        clock: &Clock,
        ctx: &mut TxContext
    ) {
        abort 0
    }

}