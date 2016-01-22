
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

(* fdtr.c *)
let fdtr  ~df1 ~df2 x = C.fdtr  df1 df2 x
let fdtrc ~df1 ~df2 x = C.fdtrc df1 df2 x
let fdtri ~df1 ~df2 p = C.fdtri df1 df2 p

(* gamma.c *)
let gamma   = C.gamma
let lgam    = C.lgam

(* gdtr.c *)
let gdtr  ~a ~b x = C.gdtr  a b x
let gdtrc ~a ~b x = C.gdtrc a b x

(* igam.c *)
let igam  ~a x = C.igam a x
let igamc ~a x = C.igamc a x

(* igami.c *)
let igami ~a p = C.igami a p

(* incbet.c *)
let incbet  ~a ~b x  = C.incbet a b x

(* incbi.c *)
let incbi ~a ~b x = C.incbi a b x

(* nbdtr.c *)
let nbdtr  ~k ~n p  = C.nbdtr  k n p
let nbdtrc ~k ~n p  = C.nbdtrc k n p
let nbdtri ~k ~n y  = C.nbdtri k n y

(* ndtr.c *)
let ndtr    = C.ndtr
let erf     = C.erf
let erfc    = C.erfc

let ndtri     = C.ndtri
let stdtri    = C.stdtri
let pow ~base = C.pow base
