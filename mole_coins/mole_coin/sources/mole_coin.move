module mole_coin::mole {
    use std::option;
    use sui::coin;
    use sui::tx_context::{TxContext};
    use sui::transfer;
    use sui::tx_context;
    use sui::object::UID;
    use sui::coin::{TreasuryCap, Coin};
    use sui::object;
    use sui::balance;

    struct MOLE has drop {}

    struct AdminCap has key, store {
        id: UID,
        treasuryCap: TreasuryCap<MOLE>,
        package_version: u64
    }

    struct MoleCoinInfo has key {
        id: UID,
        manual_minted: u64,
    }

    public entry fun burn(
        admin_cap: &mut AdminCap,
        coin_to_burn: &mut Coin<MOLE>,
        amount: u64,
        ctx: &mut TxContext
    ) {
        abort 0
    }

    public fun cap(): u64 {
        abort 0
    }

}