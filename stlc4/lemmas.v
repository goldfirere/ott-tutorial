Require Import stlcott.

Lemma canonical_forms : forall v t1 t2,
  is_value_of_expr(v) = true ->
  Jtype nil v (t_arrow t1 t2) ->
  exists x, exists t, exists e, v = e_abs x t e.
Proof.
  intros v t1 t2 Hval Htype. destruct v; simpl in Hval; inversion Hval.
    exists x. exists t. exists v. reflexivity.
Qed.

