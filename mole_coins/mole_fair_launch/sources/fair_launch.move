module mole_fair_launch::fair_launch {
    use std::vector;
    use std::string::String;
    use std::string;
    use std::ascii;
    use std::type_name;
    use sui::object::UID;
    use sui::tx_context::TxContext;
    use sui::transfer;
    use sui::object;
    use sui::tx_context;
    use sui::balance::Balance;
    use sui::table::Table;
    use sui::coin;
    use sui::balance;
    use sui::table;
    use sui::bag::Bag;
    use sui::bag;
    use sui::coin::{Coin};
    use sui::event;
    use mole_coin::mole;
    use mole_coin::mole::{MOLE, MoleCoinInfo};
    use mole_fair_launch::fair_launch_emergency;
    use mole_fair_launch::fair_launch_emergency::{EmergencyStatus, assert_no_emergency};
    use sui::pay;
    use sui::clock::Clock;
    use sui::clock;

    struct AdminCap has key, store {
        id: UID
    }

    struct UserInfo<phantom StakingCoin> has store {
        amount: u64,
        reward_debt: u64
    }

    struct UserCapability<phantom StakingCoin> has store {
        user: address,
        is_object: bool
    }

    struct User has drop, copy, store {
        address: address,
        is_object: bool
    }

    struct PoolInfo has store {
        alloc_point: u64,
        last_reward_time: u64,
        acc_mole_per_share: u128,
        is_debt_token_pool: bool,
        staked_balance: u64
    }

    struct PoolInfoStore has store {
        bonus_addr: address,
        dev_percent: u64,
        mole_per_second: u64,
        max_mole_per_second: u64,
        pools: vector<PoolInfo>,
        total_alloc_point: u64,
        coin_mole: Balance<MOLE>,
        stake_debt_token_allowance: Table<u64, Table<User, bool>>
    }

    struct Pool<phantom StakingCoin> has store {
        pid: u64,
        coin_staking: Balance<StakingCoin>,
        user_info: Table<User, UserInfo<StakingCoin>>
    }

    struct Storage has key {
        id: UID,
        pool_infos: PoolInfoStore,
        emergency_status: EmergencyStatus,
        pools: Bag,
        mole_admin_cap: mole_coin::mole::AdminCap,
        package_version: u64,
        mole_reward_bounty: Balance<MOLE>
    }

    struct DepositEvent<phantom StakingCoin> has copy, drop {
        user: address,
        pid: u64,
        amount: u64
    }

    struct WithdrawEvent<phantom StakingCoin> has copy, drop {
        user: address,
        pid: u64,
        amount: u64
    }

    struct EmergencyWithdrawEvent<phantom StakingCoin> has copy, drop {
        user: address,
        pid: u64,
        amount: u64
    }


    public entry fun add_pool<StakingCoin>(
        _: &AdminCap,
        storage: &mut Storage,
        alloc_point: u64,
        is_debt_token_pool: bool,
        with_update: bool,
        clock: &Clock,
        ctx: &mut TxContext
    ) {
        abort 0
    }

    public entry fun set_pool<StakingCoin>(
        _: &AdminCap,
        storage: &mut Storage,
        alloc_point: u64,
        with_update: bool,
        clock: &Clock,
        ctx: &mut TxContext
    ) {
        abort 0
    }

    public entry fun deposit<StakingCoin>(
        storage: &mut Storage,
        for: address,
        coin_stakings: vector<Coin<StakingCoin>>,
        amount: u64,
        clock: &Clock,
        ctx: &mut TxContext
    ) {
        abort 0
    }

    public entry fun deposit_single<StakingCoin>(
        storage: &mut Storage,
        for: address,
        coin_staking: Coin<StakingCoin>,
        amount: u64,
        clock: &Clock,
        ctx: &mut TxContext
    ) {
        abort 0
    }

    public entry fun withdraw<StakingCoin>(
        storage: &mut Storage,
        for: address,
        amount: u64,
        clock: &Clock,
        ctx: &mut TxContext
    ) {
        abort 0
    }

    public entry fun withdraw_all<StakingCoin>(
        storage: &mut Storage,
        for: address,
        clock: &Clock,
        ctx: &mut TxContext
    ) {
        abort 0
    }


    public entry fun approve_stake_debt_token(
        _: &AdminCap,
        storage: &mut Storage,
        pid: u64,
        staker: address,
        is_object: bool,
        allow: bool,
        ctx: &mut TxContext
    ) {
        abort 0
    }

    public entry fun approve_stake_debt_tokens(
        _: &AdminCap,
        storage: &mut Storage,
        pids: vector<u64>,
        stakers: vector<address>,
        is_object: bool,
        allow: bool,
        ctx: &mut TxContext
    ) {
        abort 0
    }

    public entry fun set_mole_per_second(
        _: &AdminCap,
        storage: &mut Storage,
        mole_per_second: u64,
        with_update: bool,
        clock: &Clock,
        ctx: &mut TxContext
    ) {
        abort 0
    }

    public entry fun set_max_mole_per_second(
        _: &AdminCap,
        storage: &mut Storage,
        max_mole_per_second: u64
    ) {
        abort 0
    }

    public fun get_pool_name<StakingCoin>(): String {
        abort 0
    }

    public fun exists_pool<StakingCoin>(storage: &Storage): bool {
        abort 0
    }
    
    public entry fun withdraw_mole_rewards_bounty<BaseCoin, FarmingCoin, LP>(
        _: &AdminCap,
        storage: &mut Storage,
        is_withdraw_all: bool,
        withdraw_mole_value: u64,
        ctx: &mut TxContext
    ) {
        abort 0
    }

    public fun pending_mole<StakingCoin>(
        storage: &mut Storage,
        user: address,
        is_object: bool,
        clock: &Clock
    ): u64 {
		abort 0
	}

    public fun get_pid<StakingCoin>(storage: &mut Storage): u64 {
        abort 0
    }

    public fun pool_length(storage: &Storage): u64 {
        abort 0
    }

    public fun alloc_point<StakingCoin>(storage: &mut Storage): u64 {
        abort 0
    }

    public fun total_alloc_point(storage: &mut Storage): u64 {
        abort 0
    }

    public fun is_stake_debt_token_allow(storage: &Storage, pid: u64, staker: address, is_object: bool): bool {
        abort 0
    }

    public fun mul_div(x: u64, y: u64, z: u64): u64 {
        abort 0
    }

    public fun mul_to_u128(x: u64, y: u64): u128 {
        abort 0
    }

   
}