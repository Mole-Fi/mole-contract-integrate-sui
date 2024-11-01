module mole_vault::vault {
    use std::vector;
    use sui::balance::{Balance, Supply};
    use sui::object::UID;
    use sui::tx_context::TxContext;
    use sui::transfer;
    use sui::object;
    use sui::tx_context;
    use mole::global_storage;
    use mole::global_storage::GlobalStorage;
    use sui::coin;
    use sui::coin::{CoinMetadata, Coin};
    use sui::balance;
    use sui::table;
    use sui::table::Table;
    use mole_fair_launch::fair_launch;
    use mole::emergency;
    use mole_vault::vault_config;
    use sui::math;
    use sui::event;
    use sui::pay;
    use std::option;
    use std::option::Option;
    use mole::mole_math;
    use mole_coin::mole::MOLE;
    use mole::coder;
    use sui::clock::Clock;
    use sui::clock;

    struct VaultInfo<phantom CoinType> has store {
        config_addr: address,
        vault_debt_share: u64,
        vault_debt_val: u64,
        last_accrue_time: u64,
        reserve_pool: u64,
        decimals: u8,
        coin: Balance<CoinType>,
        magic_coin_supply: Supply<MagicCoin<CoinType>>,
        debt_coin_supply: Supply<DebtCoin<CoinType>>,
        positions: Table<u64, Position<CoinType>>,
        next_position_id: u64,
        fair_launch_user_cap: fair_launch::UserCapability<DebtCoin<CoinType>>
    }

    struct MagicCoin<phantom CoinType> has drop {}

    struct DebtCoin<phantom CoinType> has drop {}

    struct AddCollateralContext<phantom CoinType> {
        id: u64,
        debt: u64,
        coin_send: Coin<CoinType>,
        health_before: u64,
        worker: address,
        amount: u64
    }

    struct WorkContext<phantom CoinType> {
        id: u64,
        debt: u64,
        coin_send: Coin<CoinType>,
        coin_back: Coin<CoinType>,
        health: u64,
        account_addr: address
    }

    struct KillContext<phantom CoinType> {
        id: u64,
        debt: u64,
        coin_back: Coin<CoinType>,
        health: u64,
        liquidator_addr: address
    }

    struct Position<phantom CoinType> has store, drop {
        worker: address,
        owner: address,
        debt_share: u64,
    }

    struct DepositEvent<phantom CoinType> has copy, drop {
        account: address,
        amount: u64,
        share: u64
    }

    struct WithdrawEvent<phantom CoinType> has copy, drop {
        account: address,
        share: u64,
        amount: u64
    }

    struct AddDebtEvent<phantom CoinType> has copy, drop {
        id: u64,
        debt_share: u64
    }

    struct RemoveDebtEvent<phantom CoinType> has copy, drop {
        id: u64,
        debt_share: u64
    }

    struct WorkEvent<phantom CoinType> has copy, drop {
        id: u64,
        loan: u64
    }

    struct KillEvent<phantom CoinType> has copy, drop {
        id: u64,
        killer: address,
        owner: address,
        posVal: u64,
        debt: u64,
        prize: u64,
        left: u64
    }

    struct AddCollateralEvent<phantom CoinType> has copy, drop {
        id: u64,
        amount: u64,
        health_before: u64,
        health_after: u64
    }

    struct PositionOperatorFeature<phantom CoinType> {}

    struct VaultCap<phantom Feature> has store {}

    struct AdminCap has key, store {
        id: UID
    }

    struct PositionSignerCap<phantom CoinType> has store {
        account: address
    }

    struct PositionSigner<phantom CoinType> has drop {
        address: address
    }


    public entry fun update_config<CoinType>(
        _: &AdminCap,
        storage: &mut GlobalStorage,
        config_addr: address
    ) {
        abort 0
    }

    public entry fun deposit<CoinType>(
        storage: &mut GlobalStorage,
        coin_deposits: vector<Coin<CoinType>>,
        amount: u64,
        clock: &Clock,
        ctx: &mut TxContext
    ) {
        abort 0
    }

   
    public entry fun deposit_single<CoinType>(
        storage: &mut GlobalStorage,
        coin_deposit: Coin<CoinType>,
        amount: u64,
        clock: &Clock,
        ctx: &mut TxContext
    ) {
        abort 0
    }

	// Deposit function for contract to call. For vector
	// storage: mole::global_storage::GlobalStorage
	// coin_deposit: coin vector to deposit 
	// amount: deposit amount
    public fun deposit_in<CoinType>(
        storage: &mut GlobalStorage,
        coin_deposits: vector<Coin<CoinType>>,
        amount: u64,
        clock: &Clock,
        ctx: &mut TxContext
    ): Coin<mole_vault::vault::MagicCoin<CoinType>> {
        abort 0
    }

    // Deposit function for contract to call. For single coin
	// storage: mole::global_storage::GlobalStorage
	// coin_deposit: coin to deposit 
	// amount: deposit amount
    public fun deposit_single_in<CoinType>(
        storage: &mut GlobalStorage,
        coin_deposit: Coin<CoinType>,
        amount: u64,
        clock: &Clock,
        ctx: &mut TxContext
    ): Coin<MagicCoin<CoinType>> {
        abort 0
    }


    public entry fun withdraw<CoinType>(
        storage: &mut GlobalStorage,
        coin_withdraws: vector<Coin<MagicCoin<CoinType>>>,
        amount: u64,
        clock: &Clock,
        ctx: &mut TxContext
    ) {
        abort 0
    }

    public entry fun withdraw_single<CoinType>(
        storage: &mut GlobalStorage,
        coin_withdraw: Coin<MagicCoin<CoinType>>,
        share: u64,
        clock: &Clock,
        ctx: &mut TxContext
    ) {
       abort 0
    }

    /// called by other contract
    // Withdraw function for contract to call. For vector
	// storage: mole::global_storage::GlobalStorage
	// amount: magic coin vector to withdraw 
    public fun withdraw_out<CoinType>(
        storage: &mut GlobalStorage,
        coin_withdraws: vector<Coin<MagicCoin<CoinType>>>,
        amount: u64,
        clock: &Clock,
        ctx: &mut TxContext
    ):Coin<CoinType> {
        abort 0
    }

    /// called by other contract
    // Withdraw function for contract to call. For single coin
	// storage: mole::global_storage::GlobalStorage
	// share: magic coin to withdraw 
    public fun withdraw_single_out<CoinType>(
        storage: &mut GlobalStorage,
        coin_withdraw: Coin<MagicCoin<CoinType>>,
        share: u64,
        clock: &Clock,
        ctx: &mut TxContext
    ):Coin<CoinType> {
        abort 0
    }

    public entry fun withdraw_reserve<CoinType>(
        _: &AdminCap,
        storage: &mut GlobalStorage,
        to: address,
        value: u64,
        ctx: &mut TxContext
    ) {
        abort 0
    }

    public entry fun reduceReserve<CoinType>(
        _: &AdminCap,
        storage: &mut GlobalStorage,
        value: u64
    ) {
        abort 0
    }

    public fun get_position_signer_address<CoinType>(position_signer: &PositionSigner<CoinType>): address {
        abort 0
    }

    public fun get_position_signer_cap<CoinType>(_: &AdminCap, uid: &UID): PositionSignerCap<CoinType> {
        abort 0
    }

    public fun get_position_signer<CoinType>(ctx: &TxContext): PositionSigner<CoinType> {
        abort 0
    }

    public fun get_position_signer_with_capability<CoinType>(
        cap: &PositionSignerCap<CoinType>
    ): PositionSigner<CoinType> {
        abort 0
    }

    public fun get_position_signer_or_default<CoinType>(
        account: Option<PositionSigner<CoinType>>,
        ctx: &TxContext
    ): PositionSigner<CoinType> {
        abort 0
    }

    public fun is_vault_initialized<CoinType>(storage: &GlobalStorage): bool {
        abort 0
    }

    public fun acquire_position_operator_cap<CoinType>(_: &AdminCap): VaultCap<PositionOperatorFeature<CoinType>> {
        VaultCap<PositionOperatorFeature<CoinType>> {}
    }

    public fun before_add_collateral<CoinType>(
        _: &VaultCap<PositionOperatorFeature<CoinType>>,
        storage: &mut GlobalStorage,
        f_storage: &mut fair_launch::Storage,
        account: &PositionSigner<CoinType>,
        id: u64,
        coin_base: Coin<CoinType>,
        go_rogue: bool,
        health: u64,
        is_stable: bool,
        is_reserve_consistent: bool,
        clock: &Clock,
        ctx: &mut TxContext
    ): AddCollateralContext<CoinType> {
        abort 0
    }

    public fun after_add_collateral<CoinType>(
        _: &VaultCap<PositionOperatorFeature<CoinType>>,
        storage: &mut GlobalStorage,
        add_collateral_context: AddCollateralContext<CoinType>,
        go_rogue: bool,
        health: u64,
        is_stable: bool,
        is_reserve_consistent: bool
    ) {
        abort 0
    }

    public fun before_work<CoinType>(
        _: &VaultCap<PositionOperatorFeature<CoinType>>,
        storage: &mut GlobalStorage,
        f_storage: &mut fair_launch::Storage,
        account: &PositionSigner<CoinType>,
        id: u64,
        worker: address,
        coin_principal: Coin<CoinType>,
        borrow_amount: u64,
        is_stable: bool,
        clock: &Clock,
        ctx: &mut TxContext
    ): (WorkContext<CoinType>, Coin<MOLE>) {
        abort 0
    }

    public fun after_work<CoinType>(
        _: &VaultCap<PositionOperatorFeature<CoinType>>,
        storage: &mut GlobalStorage,
        f_storage: &mut fair_launch::Storage,
        account: &PositionSigner<CoinType>,
        work_context: WorkContext<CoinType>,
        max_return: u64,
        is_stable: bool,
        clock: &Clock,
        ctx: &mut TxContext
    ): Coin<MOLE> {
        abort 0
    }

    public fun after_worker_direct_external<CoinType>(
        _: &VaultCap<PositionOperatorFeature<CoinType>>,
        storage: &mut GlobalStorage,
        f_storage: &mut fair_launch::Storage,
        account: &PositionSigner<CoinType>,
        work_context: WorkContext<CoinType>,
        max_return: u64,
        is_stable: bool,
        clock: &Clock,
        ctx: &mut TxContext
    ): (Coin<CoinType>, Coin<MOLE>) {
        abort 0
    }

    public fun before_kill<CoinType>(
        _: &VaultCap<PositionOperatorFeature<CoinType>>,
        storage: &mut GlobalStorage,
        f_storage: &mut fair_launch::Storage,
        account: &PositionSigner<CoinType>,
        id: u64,
        health: u64,
        is_stable: bool,
        clock: &Clock,
        ctx: &mut TxContext
    ): KillContext<CoinType> {
        abort 0
    }


    public fun after_kill<CoinType>(
        _: &VaultCap<PositionOperatorFeature<CoinType>>,
        storage: &mut GlobalStorage,
        _f_storage: &mut fair_launch::Storage,
        account: &PositionSigner<CoinType>,
        kill_context: KillContext<CoinType>,
        ctx: &mut TxContext
    ) {
        abort 0
    }


    public fun extract_add_collateral_context_coin_send<CoinType>(
        add_collateral_context: &mut AddCollateralContext<CoinType>,
        ctx: &mut TxContext
    ): Coin<CoinType> {
        abort 0
    }

    public fun get_add_collateral_context_debt<CoinType>(add_collateral_context: &AddCollateralContext<CoinType>): u64 {
        abort 0
    }

    public fun get_work_context_id<CoinType>(worker_context: &WorkContext<CoinType>): u64 {
        abort 0
    }

    public fun get_work_context_debt<CoinType>(worker_context: &WorkContext<CoinType>): u64 {
        abort 0
    }

    public fun pending_interest<CoinType>(storage: &GlobalStorage, value: u64, clock: &Clock): u64 {
        abort 0
    }

    public fun total_token<CoinType>(storage: &GlobalStorage): u64 {
        abort 0
    }

    public fun total_token_from_vault_info<CoinType>(vault_info: &VaultInfo<CoinType>): u64 {
        abort 0
    }

    public fun get_vault_base_coin_balance<CoinType>(storage: &GlobalStorage): u64 {
        abort 0
    }

    public fun get_reserve_pool<CoinType>(storage: &GlobalStorage): u64 {
        abort 0
    }

    public fun get_vault_debt_share<CoinType>(storage: &GlobalStorage): u64 {
        abort 0
    }

    public fun get_vault_debt_value<CoinType>(storage: &GlobalStorage): u64 {
        abort 0
    }

    public fun position_debt_share<CoinType>(storage: &GlobalStorage, id: u64): u64 {
        abort 0
    }

    // mToken to token
    public fun magic_share_to_token_amount<CoinType>(vault_info: &VaultInfo<CoinType>, magic_share: u64): u64 {
        abort 0
    }

    // token to mToken
    public fun token_amount_to_magic_share<CoinType>(vault_info: &VaultInfo<CoinType>, token_amount: u64): u64 {
        abort 0
    }

}