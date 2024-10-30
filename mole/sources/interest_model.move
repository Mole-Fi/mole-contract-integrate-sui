/// support customerized interests models.
/// if not stored the interest_model in global storage, by default will use triple_slope_model.move
module mole::interest_model {
    use std::vector;
    use sui::tx_context::TxContext;
    use sui::tx_context;
    use mole::triple_slope_model;
    use mole::global_storage::GlobalStorage;
    use mole::global_storage;

    struct UtilizationZone has store {
        next_zone_value: u128,
        k: u128,
        is_k_negative: bool,
        c: u128,
        is_c_negative: bool
    }

    struct UtilizationZoneStore has store {
        zones: vector<UtilizationZone>
    }

    public fun register(storage: &mut GlobalStorage, ctx: &mut TxContext) {
        abort 0
    }

    public fun get_interest_rate(
        storage: &GlobalStorage,
        model: address,
        debt: u64,
        floating: u64,
    ): u64 {
        abort 0
    }

    public fun get_interest_rate_scale(): u64 {
        abort 0
    }

}
