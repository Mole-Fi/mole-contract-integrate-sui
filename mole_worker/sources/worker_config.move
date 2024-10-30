module mole_worker::worker_config {
    use std::type_name::TypeName;
    use std::type_name;
    use sui::table;
    use sui::object::UID;
    use sui::tx_context::TxContext;
    use sui::transfer;
    use sui::tx_context;
    use sui::object;
    use mole::global_storage;
    use mole::global_storage::GlobalStorage;

    struct WorkerConfig has store, drop {
        accept_debt: bool,
        work_factor: u64,
        kill_factor: u64,
        max_price_diff: u64
    }

    struct WorkerConfigStore has store {
        oracle: address,
        workers: table::Table<address, WorkerConfig>,
        governor: address
    }

    struct ConfigCapability has key, store {
        id: UID,
        config: address
    }

    struct WorkerInfo has store {
        base_coin_type: TypeName,
        farming_coin_type: TypeName,
        lp_type: TypeName
    }

    struct WorkerInfoStore has key {
        id: UID,
        worker_infos: table::Table<address, WorkerInfo>
    }

    struct AdminCap has key, store {
        id: UID
    }


    public fun is_worker_info_registered(store: &WorkerInfoStore, worker: address): bool {
        abort 0
    }

    public fun register_worker_info<BaseCoin, FarmingCoin, LP>(
        _: &AdminCap,
        store: &mut WorkerInfoStore,
        worker: address
    ) {
        abort 0
    }

    public entry fun register(
        _: &AdminCap,
        storage: &mut GlobalStorage,
        oracle: address,
        ctx: &mut TxContext
    ) {
        abort 0
    }

    public fun get_oracle(
        storage: &GlobalStorage,
        config: address
    ): address {
        abort 0
    }

    public fun get_governor(
        storage: &GlobalStorage,
        config: address
    ): address {
        abort 0
    }

    public fun get_accept_debt(
        storage: &GlobalStorage,
        config: address,
        worker: address,
        is_stable: bool
    ): bool {
        abort 0
    }

    public fun get_work_factor(
        storage: &GlobalStorage,
        config: address,
        worker: address,
        _debt: u64,
        is_stable: bool
    ): u64 {
        abort 0
    }

    public fun get_kill_factor(
        storage: &GlobalStorage,
        config: address,
        worker: address,
        _debt: u64,
        is_stable: bool
    ): u64 {
        abort 0
    }

    public fun get_raw_kill_factor(
        storage: &GlobalStorage,
        config: address,
        worker: address,
        _debt: u64
    ): u64 {
        abort 0
    }

    public fun get_max_price_diff(
        storage: &GlobalStorage,
        config: address,
        worker: address
    ): u64 {
        abort 0
    }

    public fun get_max_price_diff_scale(): u64 {
        abort 0
    }

    public entry fun set_config(
        _: &AdminCap,
        config_cap: &ConfigCapability,
        storage: &mut GlobalStorage,
        worker: address,
        accept_debt: bool,
        work_factor: u64,
        kill_factor: u64,
        max_price_diff: u64
    ) {
        abort 0
    }

    public entry fun set_oracle(
        _: &AdminCap,
        config_cap: &ConfigCapability,
        storage: &mut GlobalStorage,
        oracle: address
    ) {
        abort 0
    }

    public entry fun set_governor(
        _: &AdminCap,
        config_cap: &ConfigCapability,
        storage: &mut GlobalStorage,
        governor: address
    ) {
        abort 0
    }


}