---
trigger: always_on
---
# Go 1.26 Language Features

## Initializing Variables with `new`
The built-in `new` function now allows its operand to be an expression, specifying the initial value of the variable.
- **Usage**: `new(T(v))` where `T` is the type and `v` is the initial value.
- **Benefit**: Particularly useful for optional fields represented by pointers (e.g., in JSON or Protobuf).

## Self-Referential Generic Type Parameters
Generic types may now refer to themselves in their type parameter list.
- **Usage**: `type Adder[A Adder[A]] interface { ... }`
- **Benefit**: Simplifies complex type constraints and makes them more powerful.
