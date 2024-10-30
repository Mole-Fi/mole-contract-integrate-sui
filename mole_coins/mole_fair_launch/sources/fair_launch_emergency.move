module mole_fair_launch::fair_launch_emergency {
    use sui::tx_context::TxContext;
    use sui::object::UID;
    use sui::transfer;
    use sui::object;
    use sui::tx_context;
    friend mole_fair_launch::fair_launch;

    struct EmergencyStatus has key, store{
        id: UID,
        pause: bool
    }

    struct EmergencyAdminCap has key, store {
        id: UID
    }

    public fun is_emergency(status: &EmergencyStatus): bool {
        abort 0
    }

    public fun assert_no_emergency(status: &EmergencyStatus) {
        abort 0
    }
}