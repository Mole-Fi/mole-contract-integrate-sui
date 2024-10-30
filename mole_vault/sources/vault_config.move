module mole_vault::vault_config {
    use sui::table::Table;
    use sui::tx_context::TxContext;
    use sui::tx_context;
    use sui::table;
    use sui::transfer;
    use sui::object::UID;
    use sui::object;
    use mole::global_storage::GlobalStorage;
    use mole::global_storage;
    use mole::interest_model;
    use mole_worker::worker_config;


    struct VaultConfig has store {
        min_debt_size: u64,
        reserve_pool_bps: u64,
        kill_bps: u64,
        max_kill_bps: u64,
        kill_treasury_bps: u64,
        treasury_addr: address,
        interest_model_addr: address,
        workers: Table<address, address>,
        whitelisted_liquidators: Table<address, bool>,
    }

    struct ConfigCapability has key, store {
        id: UID,
        config_addr: address
    }

    struct AdminCap has key, store {
        id: UID
    }

    public entry fun register(
        _: &AdminCap,
        storage: &mut GlobalStorage,
        min_debt_size: u64,
        reserve_pool_bps: u64,
        kill_bps: u64,
        kill_treasury_bps: u64,
        treasury_addr: address,
        interest_model_addr: address,
        ctx: &mut TxContext
    ) {
        abort 0
    }

    public fun register_for_uid(
        _: &AdminCap,
        uid: &UID,
        storage: &mut GlobalStorage,
        min_debt_size: u64,
        reserve_pool_bps: u64,
        kill_bps: u64,
        kill_treasury_bps: u64,
        treasury_addr: address,
        interest_model_addr: address,
        ctx: &mut TxContext
    ): ConfigCapability {
        abort 0
    }

    public fun get_min_debt_size(
        storage: &GlobalStorage,
        config: address
    ): u64 {
        abort 0
    }

    public fun get_reserve_pool_bps(
        storage: &GlobalStorage,
        config: address
    ): u64 {
        abort 0
    }

    public fun get_reserve_pool_bps_scale(): u64 {
        RESERVE_POOL_BPS_SCALE
    }

    public fun get_kill_bps(
        storage: &GlobalStorage,
        config: address
    ): u64 {
        abort 0
    }

    public fun get_kill_bps_scale(): u64 {
        MAX_BPS
    }

    public fun get_max_kill_bps(
        storage: &GlobalStorage,
        config: address
    ): u64 {
        abort 0
    }

    public fun get_kill_treasury_bps(
        storage: &GlobalStorage,
        config: address
    ): u64 {
        abort 0
    }

    public fun get_kill_treasury_bps_scale(): u64 {
        MAX_BPS
    }

    public fun get_treasury_addr(
        storage: &GlobalStorage,
        config: address
    ): address {
        abort 0
    }

    public fun get_interest_model_addr(
        storage: &GlobalStorage,
        config: address
    ): address {
        abort 0
    }

    public fun get_interest_rate(
        storage: &GlobalStorage,
        config: address,
        debt: u64,
        floating: u64
    ): u64 {
        abort 0
    }

    public fun get_interest_rate_scale(): u64 {
        abort 0
    }

    public fun is_worker(
        storage: &GlobalStorage,
        config: address,
        worker: address
    ): bool {
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
        debt: u64,
        is_stable: bool
    ): u64 {
        abort 0
    }

    public fun get_work_factor_scale(): u64 {
        abort 0
    }

    public fun get_kill_factor(
        storage: &GlobalStorage,
        config: address,
        worker: address,
        debt: u64,
        is_stable: bool
    ): u64 {
        abort 0
    }

    public fun get_kill_factor_scale(): u64 {
        KILL_FACTOR_SCALE
    }

    public fun get_raw_kill_factor(
        storage: &GlobalStorage,
        config: address,
        worker: address,
        debt: u64
    ): u64 {
        abort 0
    }

    public fun is_whitelisted_liquidator(
        storage: &GlobalStorage,
        config: address,
        account: address
    ): bool {
        abort 0
    }

    public entry fun set_params(
        _: &AdminCap,
        config_cap: &ConfigCapability,
        storage: &mut GlobalStorage,
        min_debt_size: u64,
        reserve_pool_bps: u64,
        kill_bps: u64,
        kill_treasury_bps: u64,
        treasury_addr: address,
        interest_model_addr: address
    ) {
        abort 0
    }

    public entry fun set_worker_config(
        _: &AdminCap,
        config_cap: &ConfigCapability,
        storage: &mut GlobalStorage,
        worker: address,
        worker_config_addr: address
    ) {
        abort 0
    }

    public entry fun set_max_kill_bps(
        _: &AdminCap,
        config_cap: &ConfigCapability,
        storage: &mut GlobalStorage,
        max_kill_bps: u64
    ) {
        abort 0
    }

    public entry fun set_whitelisted_liquidator(
        _: &AdminCap,
        config_cap: &ConfigCapability,
        storage: &mut GlobalStorage,
        liquidator: address,
        ok: bool
    ) {
        abort 0
    }
}