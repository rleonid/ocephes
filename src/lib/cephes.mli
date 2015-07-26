
(** [erf x] the error function [(2/sqrt(pi) *. \int_ 0^[x] exp (-t^2) dt]. *)
val erf : float -> float

(** [erfc x] the complement of the error function [1.0 - erf x].*)
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
