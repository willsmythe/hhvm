// RUN: %hackc compile-infer --keep-going %s | FileCheck %s

class Internal {}

class InternalGeneric<T> {}

// TEST-CHECK-BAL: define $root.internalClassParam
// CHECK: define $root.internalClassParam($this: *void, $a: *HackInt, $b: *Internal) : *Internal {
// CHECK: local $0: *void, $1: *void, $2: *void
// CHECK: #b0:
// CHECK:   jmp b1
// CHECK: #b1:
// CHECK:   n0 = __sil_lazy_class_initialize(<Internal>)
// CHECK:   store &$0 <- n0: *HackMixed
// CHECK:   n1 = __sil_allocate(<Internal>)
// CHECK:   n2 = Internal._86pinit(n1)
// CHECK:   store &$2 <- n1: *HackMixed
// CHECK:   jmp b2
// CHECK:   .handlers b4
// CHECK: #b2:
// CHECK:   jmp b3
// CHECK: #b3:
// CHECK:   n3: *HackMixed = load &$2
// CHECK:   jmp b5
// CHECK:   .handlers b4
// CHECK: #b4(n4: *HackMixed):
// CHECK:   store &$0 <- null: *HackMixed
// CHECK:   store &$1 <- null: *HackMixed
// CHECK:   store &$2 <- null: *HackMixed
// CHECK:   n5 = $builtins.hhbc_throw(n4)
// CHECK:   unreachable
// CHECK: #b5:
// CHECK:   store &$0 <- null: *HackMixed
// CHECK:   store &$1 <- null: *HackMixed
// CHECK:   store &$2 <- null: *HackMixed
// CHECK:   n6 = n3.?.__construct()
// CHECK:   n7 = $builtins.hhbc_lock_obj(n3)
// CHECK:   n8 = $builtins.hack_bool(__sil_instanceof(n3, <Internal>))
// CHECK:   n9 = $builtins.hhbc_verify_type_pred(n3, n8)
// CHECK:   ret n3
// CHECK: }
function internalClassParam(int $a, Internal $b) : Internal {
  return new Internal();
}

// TEST-CHECK-BAL: define $root.externalClassParam
// CHECK: define $root.externalClassParam($this: *void, $a: *HackBool, $b: *External) : *External {
// CHECK: local $0: *void, $1: *void, $2: *void
// CHECK: #b0:
// CHECK:   jmp b1
// CHECK: #b1:
// CHECK:   n0 = __sil_lazy_class_initialize(<External>)
// CHECK:   store &$0 <- n0: *HackMixed
// CHECK:   n1 = __sil_allocate(<External>)
// CHECK:   n2 = External._86pinit(n1)
// CHECK:   store &$2 <- n1: *HackMixed
// CHECK:   jmp b2
// CHECK:   .handlers b4
// CHECK: #b2:
// CHECK:   jmp b3
// CHECK: #b3:
// CHECK:   n3: *HackMixed = load &$2
// CHECK:   jmp b5
// CHECK:   .handlers b4
// CHECK: #b4(n4: *HackMixed):
// CHECK:   store &$0 <- null: *HackMixed
// CHECK:   store &$1 <- null: *HackMixed
// CHECK:   store &$2 <- null: *HackMixed
// CHECK:   n5 = $builtins.hhbc_throw(n4)
// CHECK:   unreachable
// CHECK: #b5:
// CHECK:   store &$0 <- null: *HackMixed
// CHECK:   store &$1 <- null: *HackMixed
// CHECK:   store &$2 <- null: *HackMixed
// CHECK:   n6 = n3.?.__construct()
// CHECK:   n7 = $builtins.hhbc_lock_obj(n3)
// CHECK:   n8 = $builtins.hack_bool(__sil_instanceof(n3, <External>))
// CHECK:   n9 = $builtins.hhbc_verify_type_pred(n3, n8)
// CHECK:   ret n3
// CHECK: }
function externalClassParam(bool $a, External $b): External {
  return new External();
}

// TEST-CHECK-BAL: define .async $root.genericParams
// CHECK: define .async $root.genericParams($this: *void, $a: *HackString, $b: *InternalGeneric) : *HackInt {
// CHECK: #b0:
// CHECK:   n0 = $builtins.hack_new_dict($builtins.hack_string("kind"), $builtins.hack_int(101), $builtins.hack_string("classname"), $builtins.hack_string("InternalGeneric"), $builtins.hack_string("generic_types"), $builtins.hhbc_new_vec($builtins.hack_new_dict($builtins.hack_string("kind"), $builtins.hack_int(4))))
// CHECK:   n1: *HackMixed = load &$b
// CHECK:   n2 = $builtins.hhbc_verify_param_type_ts(n1, n0)
// CHECK:   n3 = $builtins.hhbc_is_type_int($builtins.hack_int(42))
// CHECK:   n4 = $builtins.hhbc_verify_type_pred($builtins.hack_int(42), n3)
// CHECK:   ret $builtins.hack_int(42)
// CHECK: }
async function genericParams(string $a, InternalGeneric<string> $b): Awaitable<int> {
  return 42;
}
