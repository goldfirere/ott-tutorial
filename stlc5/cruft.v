Require Import stlcott.
Require Import List.

Lemma combine_map_fst_snd : forall (X Y : Type) (l : list (X * Y)),
  l = combine (map (@fst X Y) l) (map (@snd X Y) l).
Proof.
  intros. induction l as [| h t]; simpl.
    reflexivity.
    rewrite <- IHt. f_equal. apply surjective_pairing.
Qed.

Lemma split_list : forall {X Y : Type} (l : list (X * Y)),
  exists l1, exists l2, l = combine l1 l2 /\ length l1 = length l2.
Proof.
  intros. exists (map (@fst X Y) l). exists (map (@snd X Y) l). split.
    apply combine_map_fst_snd.
    rewrite map_length. rewrite map_length. reflexivity.
Qed.

Lemma fst_cruft_disappears : forall (X Y : Type) (l1 : list X) (l2 : list Y),
  length l1 = length l2 ->
  map (fun x => match x with (a,b) => a end) (combine l1 l2) = l1.
Proof.
  intros. generalize dependent l2.
  induction l1 as [| h1 t1]; destruct l2 as [| h2 t2]; intros;
      simpl in H; inversion H.
    reflexivity.
    simpl. apply IHt1 in H1. rewrite H1. reflexivity.
Qed.

Lemma snd_cruft_disappears : forall (X Y : Type) (l1 : list X) (l2 : list Y),
  length l1 = length l2 ->
  map (fun x => match x with (a,b) => b end) (combine l1 l2) = l2.
Proof.
  intros. generalize dependent l2.
  induction l1 as [| h1 t1]; destruct l2 as [| h2 t2]; intros;
      simpl in H; inversion H.
    reflexivity.
    simpl. apply IHt1 in H1. rewrite H1. reflexivity.
Qed.

Lemma both_cruft_disappears : forall (X Y : Type) (l1 : list X) (l2 : list Y),
  length l1 = length l2 ->
  map (fun x => match x with (a,b) => (a,b) end) (combine l1 l2) = (combine l1 l2).
Proof.
  intros. generalize dependent l2.
  induction l1 as [| h1 t1]; destruct l2 as [| h2 t2]; intros;
      simpl in H; inversion H.
    reflexivity.
    simpl. apply IHt1 in H1. rewrite H1. reflexivity.
Qed.

Ltac remove_cruft a b et :=
  set (ex2 := split_list et) in *; inversion ex2 as [a ex1]; inversion ex1 as [b conj];
  inversion conj as [comb lengths]; rewrite comb in *; rewrite fst_cruft_disappears in *;
  rewrite snd_cruft_disappears in *; rewrite both_cruft_disappears in *;
  try apply lengths; clear ex2 ex1 conj comb.

Tactic Notation "remove" "cruft" "from" constr(et) "as" ident(es) "," ident(ts) :=
  remove_cruft es ts et.