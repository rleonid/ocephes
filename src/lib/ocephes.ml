
open Ctypes

module C = Cephes_bindings.C(Cephes_generated)

let ndtr  = C.ndtr
let erf   = C.erf
let erfc  = C.erfc

let gamma = C.gamma
let lgam  = C.lgam

let igam  = C.igam
let igamc = C.igamc

let ndtri  = C.ndtri
let stdtri = C.stdtri
let pow ~base = C.pow base
