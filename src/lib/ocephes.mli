(** Bindings to Stephen Mosher's Cephes library. *)

(** {2 Binomial Distribution -- bdtr.c} *)

(** {v INSERT:bdtr.c,3,47 v} *)
val bdtr : k:int -> n:int -> float -> float

(** {v INSERT:bdtr.c,51,94 v} *)
val bdtrc : k:int -> n:int -> float -> float

(** {v INSERT:bdtr.c,98,138 v} *)
val bdtri : k:int -> n:int -> float -> float

(** {2 Beta Distribution -- btdtr.c} *)

(** {v INSERT:btdtr.c,3,42 v} *)
val btdtr : a:float -> b:float -> float -> float

(** {2 Cheybshev Series -- chbevl.c} *)

(** {v INSERT:chbevl.c,3,50 v} *)
val chbevl : ?n:int -> float -> float array -> float

(** {2 Chi-square distribution -- chdtr.c} *)

(** {v INSERT:chdtr.c,3,49 v} *)
val chdtr : df:float -> float -> float

(** {v INSERT:chdtr.c,53,99 v} *)
val chdtrc : v:float -> float -> float

(** {v INSERT:chdtr.c,103,138 v} *)
val chdtri : df:float -> float -> float

(** {2 Exponential of squared argument -- expx2.c} *)

(** {v INSERT:expx2.c,2,30 v} *)
val expx2 : float -> int -> float

(** {2 F distribution -- fdtr.c} *)

(** {v INSERT:fdtr.c,2,49 v} *)
val fdtr : df1:int -> df2:int -> float -> float

(** {v INSERT:fdtr.c,52,101 v} *)
val fdtrc : df1:int -> df2:int -> float -> float

(** {v INSERT:fdtr.c,104,153 v} *)
val fdtri :  df1:int -> df2:int -> float -> float

(** {2 Gamma function -- gamma.c} *)

(** [gamma x] computes the gamma function for [x], this is the extension of the
    factorial function to real numbers.
    {v INSERT:gamma.c,2,42 v} *)
val gamma : float -> float

(** [lgam x] computes the logarithm of the [gamma] function.
    {v INSERT:gamma.c,45,95 v} *)
val lgam : float -> float

(** {2 Gamma distribution function -- gdtr.c} *)

(** {v INSERT:gdtr.c,2,43 v} *)
val gdtr : a:float -> b:float -> float -> float

(** {v INSERT:gdtr.c,46,87 v} *)
val gdtrc : a:float -> b:float -> float -> float

(** {2 Incomplete Gamma function -- igam.c} *)

(** [igam a x] computes the regularized (divided by [gamma a])
    lower incomplete (integrate from 0 to [x]) gamma function.
    {v INSERT:igam.c,2,36 v} *)
val igam : a:float -> float -> float

(** [igamc a x] computes the regularized (divided by [gamma a])
    uppwer incomplete (integrate [x] to [infinity]) gamma function.
   {v INSERT:igam.c,39,77 v} *)
val igamc : a:float -> float -> float

(** {2 ndtr.c } *)

(** {v INSERT:ndtr.c,3,45 v} *)
val ndtr : float -> float

(** {v INSERT:ndtr.c,50,88 v} *)
val erf : float -> float

(** {v INSERT:ndtr.c,92,136 v}. *)
val erfc : float -> float

(** [ndtri p] computes the value [x] such that the integral of the normal
    probability density function from [neg_infinity] to [x] is [p].*)
val ndtri : float -> float

(** [stdtri k p] computes the value [x] such that the integral
    (from [neg_infinity] to [x]) of the Student's T probability density
    function, with [k] degrees of freedom is [p].*)
val stdtri : int -> float -> float

(** [pow ~base x] raises value [base] to the power of [x]. *)
val pow : base:float -> float -> float
