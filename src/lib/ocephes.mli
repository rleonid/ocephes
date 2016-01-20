(** Bindings to Stephen Mosher's Cephes library. *)

(** {2 bdtr.c } *)

(** {v INSERT:bdtr.c,3,47 v} *)
val bdtr : k:int -> n:int -> float -> float

(** {v INSERT:bdtr.c,51,94 v} *)
val bdtrc : k:int -> n:int -> float -> float

(** {v INSERT:bdtr.c,98,138 v} *)
val bdtri : k:int -> n:int -> float -> float

(** {2 ndtr.c } *)

(** {v INSERT:ndtr.c,3,45 v} *)
val ndtr : float -> float

(** {v INSERT:ndtr.c,50,88 v} *)
val erf : float -> float

(** {v INSERT:ndtr.c,92,136 v}. *)
val erfc : float -> float

(** [gamma x] computes the gamma function for [x], this is the extension of the
    factorial function to real numbers. *)
val gamma : float -> float

(** [lgam x] computes the logarithm of the [gamma] function.  *)
val lgam : float -> float

(** [igam a x] computes the regularized (divided by [gamma a])
    lower incomplete (integrate from 0 to [x]) gamma function. *)
val igam : float -> float -> float

(** [igamc a x] computes the regularized (divided by [gamma a])
    uppwer incomplete (integrate [x] to [infinity]) gamma function. *)
val igamc : float -> float -> float

(** [ndtri p] computes the value [x] such that the integral of the normal
    probability density function from [neg_infinity] to [x] is [p].*)
val ndtri : float -> float

(** [stdtri k p] computes the value [x] such that the integral
    (from [neg_infinity] to [x]) of the Student's T probability density
    function, with [k] degrees of freedom is [p].*)
val stdtri : int -> float -> float

(** [pow ~base x] raises value [base] to the power of [x]. *)
val pow : base:float -> float -> float
