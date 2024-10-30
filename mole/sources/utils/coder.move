module mole::coder {
    use std::vector;
    use std::string;
    use std::type_name;
    use std::ascii;

    public fun parse_u64(data: & vector<u8>, cursor: &mut u64): u64 {
        abort 0
    }

    public fun parse_bool(data: & vector<u8>, cursor: &mut u64): bool {
        abort 0
    }

    public fun parse_u128(data: & vector<u8>, cursor: &mut u64): u128 {
        abort 0
    }

    public fun decode_bool_with_offset(data: & vector<u8>, offset: u64): bool {
        abort 0
    }

    public fun decode_u64_with_offset(data: & vector<u8>, offset: u64): u64 {
        abort 0
    }

    public fun decode_u128_with_offset(data: & vector<u8>, offset: u64): u128 {
        abort 0
    }

    public fun decode_u64(data: & vector<u8>): u64 {
        abort 0
    }

    public fun decode_u64x2(data: & vector<u8>): (u64, u64) {
        abort 0
    }

    public fun decode_u64x3(data: & vector<u8>): (u64, u64, u64) {
        abort 0
    }

    public fun decode_u64x4(data: & vector<u8>): (u64, u64, u64, u64) {
        abort 0
    }

    public fun decode_u64x5(data: & vector<u8>): (u64, u64, u64, u64, u64) {
        abort 0
    }

    public fun decode_u8_with_offset(data: & vector<u8>, offset: u64): u8 {
        abort 0
    }

    public fun decode_multi_u8_with_offset(data: & vector<u8>, offset: u64, len: u64): vector<u8> {
        abort 0
    }

    public fun encode_u64(value: u64): vector<u8> {
        abort 0
    }

    public fun encode_u64x2(val1: u64, val2: u64): vector<u8> {
        abort 0
    }

    public fun encode_u64x3(val1: u64, val2: u64, val3: u64): vector<u8> {
        abort 0
    }

    public fun encode_u64x4(val1: u64, val2: u64, val3: u64, val4: u64): vector<u8> {
        abort 0
    }

    public fun encode_u64_back(vec: &mut vector<u8>, value: u64) {
        abort 0
    }

    public fun string_to_address(str: &string::String): address {
        abort 0
    }

    public fun ascii_to_address(str: &ascii::String): address {
        abort 0
    }

    public fun type_to_package_address<T>(): address {
        abort 0
    }

    
}

