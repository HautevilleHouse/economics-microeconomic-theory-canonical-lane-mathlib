import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsMicroeconomicTheoryCanonicalLaneLean

structure NormalFormGame (P : Type u) (S : Type v) where
  players : List P
  strategies : P → List S
  payoffs : P → (P → S) → ℝ

structure NashEquilibrium (P : Type u) (S : Type v) (G : NormalFormGame P S) where
  strategyProfile : P → S
  bestResponseCondition : ∀ p : P, ∀ alternative : S,
    G.payoffs p (fun q => if q = p then alternative else strategyProfile q) ≤
    G.payoffs p strategyProfile

structure GameTheoryPackage where
  existenceNash : Prop
  paretoEfficiency : Prop
  subgamePerfectEquilibrium : Prop

structure GameTheoryEvidence (G : GameTheoryPackage) where
  existenceNashClosed : G.existenceNash
  paretoEfficiencyClosed : G.paretoEfficiency
  subgamePerfectEquilibriumClosed : G.subgamePerfectEquilibrium

def GameTheoryClosed (G : GameTheoryPackage) : Prop :=
  G.existenceNash ∧ G.paretoEfficiency ∧ G.subgamePerfectEquilibrium

theorem game_theory_closed_from_evidence (G : GameTheoryPackage)
    (E : GameTheoryEvidence G) : GameTheoryClosed G := by
  exact And.intro E.existenceNashClosed (And.intro E.paretoEfficiencyClosed E.subgamePerfectEquilibriumClosed)

end EconomicsMicroeconomicTheoryCanonicalLaneLean
end HautevilleHouse