import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsMicroeconomicTheoryCanonicalLaneLean

structure ConsumerPreferences where
  consumptionSet : Type
  preferenceRelation : consumptionSet → consumptionSet → Prop
  completeness : ∀ x y, preferenceRelation x y ∨ preferenceRelation y x
  transitivity : ∀ x y z, preferenceRelation x y → preferenceRelation y z → preferenceRelation x z
  continuity : ∀ x, {y | preferenceRelation x y} ∈ topologicalSpace.consumptionSet
  monotonicity : ∀ x y, x > y → preferenceRelation x y
  convexity : ∀ x y, preferenceRelation x y → ∀ t : ℝ, t ∈ Set.Icc (0 : ℝ) 1 → preferenceRelation (t • x + (1 - t) • y) y

topologicalSpace.consumptionSet : TopologicalSpace consumptionSet := inferInstance

structure UtilityFunction (P : ConsumerPreferences) where
  carrier : Type
  utility : P.consumptionSet → ℝ
  representsPreferences : ∀ x y, P.preferenceRelation x y ↔ utility x ≥ utility y
  continuousUtility : Continuous utility

structure DemandCorrespondence (P : ConsumerPreferences) where
  priceDomain : Type
  budgetSet : P.consumptionSet → Prop
  demandSet : P.consumptionSet → Prop
  utilityMaximization : ∀ x, demandSet x → (utilityMaximizingAt x := ...)

end EconomicsMicroeconomicTheoryCanonicalLaneLean
end HautevilleHouse