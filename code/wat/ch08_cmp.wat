(module
  (import "env" "assert_eq_i32" (func $assert_eq_i32 (param i32 i32)))
  (start $main)
  (func $main (export "main")
    (call $assert_eq_i32 (call $cmp (i32.const 20) (i32.const 80)) (i32.const -1))
    (call $assert_eq_i32 (call $cmp (i32.const 70) (i32.const 30)) (i32.const 1))
    (call $assert_eq_i32 (call $cmp (i32.const 50) (i32.const 50)) (i32.const 0))
  )
  (func $cmp (param $a i32) (param $b i32) (result i32)
    (if (result i32)
      (i32.eq (local.get $a) (local.get $b))
      (then (i32.const 0))
      (else 
        (if (result i32) 
          (i32.gt_s (local.get $a) (local.get $b))
          (then (i32.const 1)) 
          (else (i32.const -1))
        )
      )
    )
  )
)