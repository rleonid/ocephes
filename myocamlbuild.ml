(* OASIS_START *)
(* OASIS_STOP *)

open Ocamlbuild_plugin;;

dispatch
  (MyOCamlbuildBase.dispatch_combine [
    begin function
    | After_rules ->
      rule "cstubs: src/lib/x_bindings.ml -> x_stubs.c, x_stubs.ml"
        ~prods:["src/lib/%_stubs.c"; "src/lib/%_generated.ml"]
        ~deps: ["src/lib_gen/%_bindgen.byte"]
        (fun env build ->
          Cmd (A(env "src/lib_gen/%_bindgen.byte")));
      copy_rule "cstubs: src/lib_gen/x_bindings.ml -> src/lib/x_bindings.ml"
        "src/lib_gen/%_bindings.ml" "src/lib/%_bindings.ml"
    | _ -> ()
    end;
    dispatch_default
  ])
