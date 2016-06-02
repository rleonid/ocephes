open Ctypes

module C(F: Cstubs.FOREIGN) = struct

  (* bdtr.c *)
  let bdtr      = F.(foreign "bdtr"    (int @-> int @-> double @-> returning double))
  let bdtrc     = F.(foreign "bdtrc"   (int @-> int @-> double @-> returning double))
  let bdtri     = F.(foreign "bdtri"   (int @-> int @-> double @-> returning double))

  (* btdtr.c *)
  let btdtr     = F.(foreign "btdtr"   (double @-> double @-> double @-> returning double))

  (* chbevl.c *)
  let chbevl    = F.(foreign "chbevl"  (double @-> ptr double @-> int @-> returning double))

  (* chdtr.c *)
  let chdtr     = F.(foreign "chdtr"   (double @-> double @-> returning double))
  let chdtrc    = F.(foreign "chdtrc"  (double @-> double @-> returning double))
  let chdtri    = F.(foreign "chdtri"  (double @-> double @-> returning double))

  (* expx2.c *)
  let expx2     = F.(foreign "expx2"   (double @-> int @-> returning double))

  (* fdtr.c *)
  let fdtr      = F.(foreign "fdtr"    (int @-> int @-> double @-> returning double))
  let fdtrc     = F.(foreign "fdtrc"   (int @-> int @-> double @-> returning double))
  let fdtri     = F.(foreign "fdtri"   (int @-> int @-> double @-> returning double))

  (* gamma.c *)
  let gamma     = F.(foreign "gamma"   (double @-> returning double))
  let lgam      = F.(foreign "lgam"    (double @-> returning double))

  (* gdtr.c *)
  let gdtr      = F.(foreign "gdtr"    (double @-> double @-> double @-> returning double))
  let gdtrc     = F.(foreign "gdtrc"   (double @-> double @-> double @-> returning double))

  (* igam.c *)
  let igam      = F.(foreign "igam"    (double @-> double @-> returning double))
  let igamc     = F.(foreign "igamc"   (double @-> double @-> returning double))

  (* igami.c *)
  let igami     = F.(foreign "igami"   (double @-> double @-> returning double))

  (* incbet.c *)
  let incbet    = F.(foreign "incbet"  (double @-> double @-> double @-> returning double))

  (* incbi.c *)
  let incbi     = F.(foreign "incbi"   (double @-> double @-> double @-> returning double))

  (* nbdtr.c *)
  let nbdtr     = F.(foreign "nbdtr"   (int @-> int @-> double @-> returning double))
  let nbdtrc    = F.(foreign "nbdtrc"  (int @-> int @-> double @-> returning double))
  let nbdtri    = F.(foreign "nbdtri"  (int @-> int @-> double @-> returning double))

  (* ndtr.c *)
  let ndtr      = F.(foreign "ndtr"    (double @-> returning double))
  let erf       = F.(foreign "erf"     (double @-> returning double))
  let erfc      = F.(foreign "erfc"    (double @-> returning double))

  (* ndtri.c *)
  let ndtri     = F.(foreign "ndtri"   (double @-> returning double))

  (* pdtr.c *)
  let pdtr      = F.(foreign "pdtr"    (int @-> double @-> returning double))
  let pdtrc     = F.(foreign "pdtrc"   (int @-> double @-> returning double))
  let pdtri     = F.(foreign "pdtri"   (int @-> double @-> returning double))

  (* stdtr.c *)
  let stdtr     = F.(foreign "stdtr"   (int @-> double @-> returning double))
  let stdtri    = F.(foreign "stdtri"  (int @-> double @-> returning double))
end
