module mole::global_storage {
    use std::type_name;
    use std::string;
    use std::ascii;
    use std::string::String;
    use sui::object::UID;
    use sui::table::Table;
    use sui::bag::Bag;
    use sui::tx_context::TxContext;
    use sui::transfer;
    use sui::object;
    use sui::table;
    use sui::tx_context;
    use sui::bag;
    use mole::emergency;
    use mole::emergency::EmergencyStatus;

    struct GlobalStorage has key {
        id: UID,
        emergency_status: EmergencyStatus,
        account_resources: Table<address, Bag>,
        shared_resources: Bag,
        package_version: u64,
    }

    struct AdminCap has key, store {
        id: UID
    }


}

