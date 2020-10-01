Require Import stlcott.
Require Import List.
Require Import cruft.

Lemma canonical_forms_arrow : forall v t1 t2,
  is_value_of_expr(v) = true ->
  Jtype nil v (t_arrow t1 t2) ->
  exists x, exists t, exists e, v = e_abs x t e.
Proof.
  intros v t1 t2 Hval Htype. destruct v; simpl in Hval; inversion Hval.
    exists x. exists t. exists v. reflexivity.
    inversion Htype.
Qed.

Lemma canonical_forms_tuple : forall v tlist,
  is_value_of_expr v = true ->
  Jtype nil v (t_tuple tlist) ->
  exists elist, v = e_tuple elist.
Proof.
  intros v tlist Hval Htype. destruct v; simpl in Hval;
      inversion Hval; inversion Htype.
      remove cruft from e_t_list as es, ts.
      exists es. reflexivity.
Qed.
    