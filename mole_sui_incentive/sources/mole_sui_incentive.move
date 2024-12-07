module mole_sui_incentive::sui_incentive {
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
    use mole_sui_incentive::sui_incentive_emergency;
    use mole_sui_incentive::sui_incentive_emergency::{EmergencyStatus, assert_no_emergency};
    use sui::pay;
    use sui::clock::Clock;
    use sui::clock;
    use sui::sui::SUI;

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
        // DONE: fix to u128
        acc_sui_per_share: u128,
        staked_balance: u64
    }

    struct PoolInfoStore has store {
        // -- global config --
        sui_per_second: u64,
        max_sui_per_second: u64,
        // -- runtime data --
        pools: vector<PoolInfo>,
        total_alloc_point: u64,
        coin_sui: Balance<SUI>
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
        package_version: u64,
    }

    struct DepositSuiEvent has drop, copy {
        user: address,
        amount: u64
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

    struct HarvestEvent<phantom StakingCoin> has copy, drop {
        user: address,
        pid: u64,
        amount: u64,
        action_type: u64,  // 0 means harvest, 1 means deposit, 2 means withdraw
    }


    // deposit (staking) mToken etc. can be extended to another kinds of pool
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

    public entry fun harvest<StakingCoin>(
        storage: &mut Storage,
        clock: &Clock,
        ctx: &mut TxContext
    ) {
        abort 0
    }

    public fun pending_sui<StakingCoin>(
        storage: &mut Storage,
        user: address,
        is_object: bool,
        clock: &Clock
    ): u64 {
         abort 0
    }

}
