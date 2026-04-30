---
description: Workflow for writing robust, table-driven tests in Go.
---

# Write Table-Driven Tests

Follow these steps to create idiomatic Go tests using tables and subtests.

## 1. Define the Test Function
Create a function named `TestXxx(t *testing.T)` in `xxx_test.go`.

## 2. Define the TestCase Struct
Create an anonymous struct inside the test function to represent a test case. Include inputs and expected outputs.

```go
tests := map[string]struct {
    input    string
    expected string
    wantErr  bool
}{
    "valid input":   {input: "hello", expected: "olleh", wantErr: false},
    "empty string":  {input: "", expected: "", wantErr: false},
    "invalid char":  {input: "\x00", expected: "", wantErr: true},
}
```

## 3. Loop and Run Subtests
Iterate over the map and use `t.Run` to execute each case.

```go
for name, tc := range tests {
    t.Run(name, func(t *testing.T) {
        // Parallelize tests if they don't share state
        t.Parallel() 

        got, err := Reverse(tc.input)

        if (err != nil) != tc.wantErr {
            t.Errorf("Reverse() error = %v, wantErr %v", err, tc.wantErr)
            return
        }
        if got != tc.expected {
            t.Errorf("Reverse() = %v, expected %v", got, tc.expected)
        }
    })
}
```

## 4. Leverage Helpers
If setup is complex, extract it to a helper function. Remember to use `t.Helper()`.

## 5. Clean up with t.Cleanup
If the test requires temporary files or database connections, register cleanup immediately.
```go
t.Cleanup(func() { db.Close() })
```
