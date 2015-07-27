open Ctypes

module Invert (B: Cstubs.BINDINGS) (I: Cstubs_inverted.INTERNAL) =
  struct
    module Ignored =
      B(struct
        type 'a fn = unit
        let foreign name fn = I.internal name fn (fun _ -> assert false)
        let foreign_value _ = failwith "foreign_value not supported"
      end)
  end

let write_declarations fmt (module B : Cstubs.BINDINGS) =
  Cstubs_inverted.write_c_header fmt ~prefix:"" (module Invert(B))

let _ =
  let fmt = Format.formatter_of_out_channel (open_out "src/lib/cephes_stubs.c") in
  (* NOTE: do NOT include <math.h>, this will confuse which erf we're using. *)
  write_declarations fmt (module Cephes_bindings.C);
  Cstubs.write_c fmt ~prefix:"caml_" (module Cephes_bindings.C);

  let fmt = Format.formatter_of_out_channel (open_out "src/lib/cephes_generated.ml") in
  Cstubs.write_ml fmt ~prefix:"caml_" (module Cephes_bindings.C)
