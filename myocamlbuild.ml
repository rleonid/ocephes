(* OASIS_START *)
(* OASIS_STOP *)

open Ocamlbuild_plugin;;

dispatch
  (MyOCamlbuildBase.dispatch_combine [
    begin function
    | After_rules ->
      ignore (Sys.command "mkdir -p _build/src/lib");
      let perl_match = "INSERT:([a-z]+.c)\,([0-9]+)\,([0-9]+)" in
      let sed_subs   = "sed -n \"$2,$3s\\/\\^ \\*\\/\\/p\" src\/lib\/$1" in
      let from_file  = "src/lib/ocephes.mli" in
      let to_file    = "_build/src/lib/ocephes.mli" in
      let command =
        Printf.sprintf "perl -pe 's/%s/`%s`/ge' %s > %s "
          perl_match sed_subs from_file to_file
      in
      ignore (Sys.command command);
      rule "cstubs: src/lib/x_bindings.ml -> x_stubs.c, x_stubs.ml"
        ~prods:["src/lib/%_stubs.c"; "src/lib/%_generated.ml"]
        ~deps: ["src/lib_gen/%_bindgen.byte"]
        (fun env build ->
          Cmd (A(env "src/lib_gen/%_bindgen.byte")));
      copy_rule "cstubs: src/lib_gen/x_bindings.ml -> src/lib/x_bindings.ml"
        "src/lib_gen/%_bindings.ml" "src/lib/%_bindings.ml";
      (*flag ["ocaml"; "pp"; "file:src/lib/ocephes.mli"]
        (Sh "perl -pe 's/INSERT:([a-z]+.c)\,([0-9]+)\,([0-9]+)/`sed -n \"$2,$3p\" src\/lib\/$1`/ge'"); *)
    | _ -> ()
    end;
      
    dispatch_default
  ])
