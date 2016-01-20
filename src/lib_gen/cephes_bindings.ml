open Ctypes

module C(F: Cstubs.FOREIGN) = struct

  let ndtr      = F.foreign "ndtr"    (double @-> returning double)
  let erf       = F.foreign "erf"      (double @-> returning double)
  let erfc      = F.foreign "erfc"     (double @-> returning double)

  let gamma     = F.foreign "gamma"    (double @-> returning double)
  let lgam      = F.foreign "lgam"     (double @-> returning double)

  let igam      = F.foreign "igam"     (double @-> double @-> returning double)
  let igamc     = F.foreign "igamc"    (double @-> double @-> returning double)

  let ndtri     = F.foreign "ndtri"    (double @-> returning double)
  let stdtri    = F.foreign "stdtri"   (int @-> double @-> returning double)
  let pow       = F.foreign "pow"      (double @-> double @-> returning double)
end
