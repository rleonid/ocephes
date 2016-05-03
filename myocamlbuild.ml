open Ocamlbuild_plugin

let () =
  let additional_rules = function
    | After_rules ->
      (* This hackery transforms the documentation found in the OCephes's
         original *.c files into documentation of our .mli file. *)
      ignore (Sys.command "mkdir -p _build/src/lib");
      (* From the range specified in 2nd to 3rd arguments strip
         the "^ *" from file in 1st arg.  *)
      let perl_match = "INSERT:([a-z0-9]+.c)\\,([0-9]+)\\,([0-9]+)" in
      let sed_subs   = "sed -n \"$2,$3s|\\^ \\\\*||p\" src\\/lib\\/$1" in
      let sed_str_sp = "sed \"\\/\\^\\$\\/d\" " in
      let from_file  = "src/lib/ocephes.mli" in
      let to_file    = "_build/src/lib/ocephes.mli" in
      let command =
        Printf.sprintf "perl -pe 's/%s/`%s | %s`/ge' %s > %s "
          perl_match sed_subs sed_str_sp from_file to_file
      in
      (*Printf.printf "%s\n" command; *)
      (* Failed attempt to perform this pre-processing with 'pp' flag
      flag ["ocaml"; "pp"; "file:src/lib/ocephes.mli"]
        (Sh "perl -pe 's/INSERT:([a-z]+.c)\,([0-9]+)\,([0-9]+)/`sed -n \"$2,$3p\" src\/lib\/$1`/ge'"); *)
      ignore (Sys.command command);

      (* Rules to build the library, generate stubs *)
      rule "cstubs: src/lib/x_bindings.ml -> x_stubs.c, x_stubs.ml"
        ~prods:["src/lib/%_stubs.c"; "src/lib/%_generated.ml"]
        ~deps: ["src/lib_gen/%_bindgen.byte"]
        (fun env build ->
          Cmd (A(env "src/lib_gen/%_bindgen.byte")));
      copy_rule "cstubs: src/lib_gen/x_bindings.ml -> src/lib/x_bindings.ml"
        "src/lib_gen/%_bindings.ml" "src/lib/%_bindings.ml";

      (* Add header file as source. *)
      dep ["c"; "compile"] ["src/lib/mconf.h"];

      (* How to compile C *)
      flag ["compile";"c"]
        (S [ A"-ccopt"; A"-O2" ; A"-ccopt"; A"-Wall"
          (* necessary for OCamlbuild versions < 0.9 ie the 4.02.3 *)
           ; A"-I"; A"src/lib"; A"-package"; A"ctypes,ctypes.foreign,ctypes.stubs"]);

      (* Set linking commands. *)
      flag ["native"; "library"; "link"; "ocaml"; "use_cephes_stubs" ]
        (S [ A"-cclib"; A"-lcephes_stubs"; ]);
      flag ["byte";   "library"; "link"; "ocaml"; "use_cephes_stubs" ]
        (S [ A"-cclib"; A"-lcephes_stubs"; A"-dllib"; A"-lcephes_stubs"; ]);

      (* For test.byte *)
      flag ["byte"; "program"; "link"; "ocaml"; "use_cephes_stubs" ]
        (S [ A"-custom"; A"-ccopt"; A"-Lsrc/lib"; A"-cclib"; A"-lcephes_stubs" ]);

      (* For test.native *)
      flag ["native"; "program"; "link"; "ocaml"; "use_cephes_stubs" ]
        (S [             A"-ccopt"; A"-Lsrc/lib"; A"-cclib"; A"-lcephes_stubs" ]);

    | Before_hygiene  -> ()
    | After_hygiene   -> ()
    | Before_options  -> ()
    | After_options   -> ()
    | Before_rules    -> ()
  in
  dispatch additional_rules
