import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsMicroeconomicTheoryCanonicalLaneLean

structure ArrowDebreuCommoditySpace (C : Type u) where
  priceSystem : C → ℝ
  endowment : C → ℝ
  utilityFunction : C → ℝ

structure GeneralEquilibriumPackage where
  existence : Prop
  paretoOptimality : Prop
  uniqueness : Prop

structure GeneralEquilibriumEvidence (G : GeneralEquilibriumPackage) where
  existenceClosed : G.existence
  paretoOptimalityClosed : G.paretoOptimality
  uniquenessClosed : G.uniqueness

def GeneralEquilibriumClosed (G : GeneralEquilibriumPackage) : Prop :=
  G.existence ∧ G.paretoOptimality ∧ G.uniqueness

theorem general_equilibrium_closed_from_evidence (G : GeneralEquilibriumPackage)
    (E : GeneralEquilibriumEvidence G) : GeneralEquilibriumClosed G := by
  exact And.intro E.existenceClosed (And.intro E.paretoOptimalityClosed E.uniquenessClosed)

end EconomicsMicroeconomicTheoryCanonicalLaneLean
end HautevilleHouse