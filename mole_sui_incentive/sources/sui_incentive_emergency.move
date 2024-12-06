module mole_sui_incentive::sui_incentive_emergency {
    use sui::tx_context::TxContext;
    use sui::object::UID;
    use sui::transfer;
    use sui::object;
    use sui::tx_context;
    friend mole_sui_incentive::sui_incentive;

    struct EmergencyStatus has key, store{
        id: UID,
        pause: bool
    }

    struct EmergencyAdminCap has key, store {
        id: UID
    }

}