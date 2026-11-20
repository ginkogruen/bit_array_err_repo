const bit_array = <<"Hello from bit_array_err_repro!":utf8>>

pub fn main() -> Nil {
  case bit_array {
    <<_:8-unit(4)-bits>> -> panic as "Success!"
    _ -> panic as "Reached _"
  }
}
