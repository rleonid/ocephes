
open Ctypes

module C = Cephes_bindings.C(Cephes_generated)

(* bdtr.c *)

let bdtr ~k ~n = C.bdtr k n
let bdtrc ~k ~n = C.bdtrc k n
let bdtri ~k ~n = C.bdtri k n

(* btdtr.c *)
let btdtr ~a ~b = C.btdtr a b

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
