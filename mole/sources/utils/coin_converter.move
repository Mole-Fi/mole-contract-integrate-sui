module mole::coin_converter {
    use std::string;
    use sui::coin::Coin;
    use sui::bag;
    use sui::tx_context::TxContext;
    
    public fun cast<In, Out>(coin_in: Coin<In>, ctx: &mut TxContext): Coin<Out> {
        abort 0
    }
}



