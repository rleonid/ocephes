
open Ctypes

module C = Cephes_bindings.C(Cephes_generated)

(* bdtr.c *)
let bdtr  ~k ~n = C.bdtr  k n
let bdtrc ~k ~n = C.bdtrc k n
let bdtri ~k ~n = C.bdtri k n

(* btdtr.c *)
let btdtr ~a ~b = C.btdtr a b

(* chbevl.c  *)
let chbevl ?n x c =
  let n     = match n with | None -> Array.length c | Some n -> n in
  (* Is this the correct way? *)
  let c_arr = CArray.make double n in
  for i = 0 to n - 1 do CArray.unsafe_set c_arr i c.(i) done;
  C.chbevl x (CArray.start c_arr) n

(* chdtr.c *)
let chdtr  ~df x = C.chdtr  df x
let chdtrc ~v  x = C.chdtrc v  x
let chdtri ~df x = C.chdtri df x

(* expx2.c *)
let expx2   = C.expx2

(* ndtr.c *)
let ndtr    = C.ndtr
let erf     = C.erf
let erfc    = C.erfc

let gamma   = C.gamma
let lgam    = C.lgam

let igam      = C.igam
let igamc     = C.igamc

let ndtri     = C.ndtri
let stdtri    = C.stdtri
let pow ~base = C.pow base
