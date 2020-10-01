Require Import stlcott.

Lemma canonical_forms : 
  (* WRITE THEOREM HERE *)
Proof.
  intros v t1 t2 Hval Htype. destruct v; simpl in Hval; inversion Hval.
    exists x. exists t. exists v. reflexivity.
Qed.

