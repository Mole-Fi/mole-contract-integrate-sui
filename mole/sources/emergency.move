module mole::emergency {
    use sui::object::UID;
    use sui::tx_context::TxContext;
    use sui::transfer;
    use sui::object;
    use sui::tx_context;

    struct EmergencyStatus has key, store {
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