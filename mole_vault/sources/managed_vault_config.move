module mole_vault::managed_vault_config {
    use sui::object::UID;
    use sui::table::Table;
    use sui::transfer;
    use sui::object;
    use sui::tx_context::TxContext;
    use sui::table;
    use sui::tx_context;
    use sui::event;
    use mole_vault::vault_config;
    use mole::global_storage::GlobalStorage;
    use mole::global_storage;

    struct ManagedVaultConfig has key {
        id: UID,
        configs: Table<address, vault_config::ConfigCapability>,
        uids: Table<address, UID>
    }

    struct NewConfigEvent has copy, drop {
        config: address
    }

    struct AdminCap has key, store {
        id: UID
    }

    public entry fun new_config(
        _: &AdminCap,
        vault_config_admincap: &vault_config::AdminCap,
        config: &mut ManagedVaultConfig,
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

    public entry fun set_params(
        _: &AdminCap,
        vault_config_admincap: &vault_config::AdminCap,
        config: &mut ManagedVaultConfig,
        storage: &mut GlobalStorage,
        config_addr: address,
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
        vault_config_admincap: &vault_config::AdminCap,
        config: &mut ManagedVaultConfig,
        storage: &mut GlobalStorage,
        config_addr: address,
        worker: address,
        worker_config_addr: address
    ) {
        abort 0
    }

    public entry fun set_max_kill_bps(
        _: &AdminCap,
        vault_config_admincap: &vault_config::AdminCap,
        config: &mut ManagedVaultConfig,
        storage: &mut GlobalStorage,
        config_addr: address,
        max_kill_bps: u64
    ) {
        abort 0
    }

}