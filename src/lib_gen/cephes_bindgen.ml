open Ctypes

let _ =
  let fmt = Format.formatter_of_out_channel (open_out "src/lib/cephes_stubs.c") in
  (* NOTE: do NOT include <math.h>, this will confuse which erf we're using. *)
  Format.fprintf fmt "double erf(double);@.";
  Format.fprintf fmt "double erfc(double);@.";
  Format.fprintf fmt "double gamma(double);@.";
  Format.fprintf fmt "double lgam(double);@.";
  Format.fprintf fmt "double igam(double,double);@.";
  Format.fprintf fmt "double igamc(double,double);@.";
  Cstubs.write_c fmt ~prefix:"caml_" (module Cephes_bindings.C);

  let fmt = Format.formatter_of_out_channel (open_out "src/lib/cephes_generated.ml") in
  Cstubs.write_ml fmt ~prefix:"caml_" (module Cephes_bindings.C)
