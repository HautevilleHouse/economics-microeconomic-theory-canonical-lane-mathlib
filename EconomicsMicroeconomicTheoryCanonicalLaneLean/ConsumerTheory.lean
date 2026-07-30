import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsMicroeconomicTheoryCanonicalLaneLean

structure ConsumerPreference where
  consumptionSet : Type u
  preferenceRelation : consumptionSet → consumptionSet → Prop
  completeness : ∀ x y : consumptionSet, preferenceRelation x y ∨ preferenceRelation y x
  transitivity : ∀ x y z : consumptionSet, preferenceRelation x y → preferenceRelation y z → preferenceRelation x z
  continuity : Prop
  localNonSatiation : Prop
  strictConvexity : Prop

structure UtilityRepresentation where
  consumerPreference : ConsumerPreference
  utilityFunction : consumerPreference.consumptionSet → ℝ
  representationProperty : ∀ x y : consumerPreference.consumptionSet,
    consumerPreference.preferenceRelation x y ↔ utilityFunction x ≥ utilityFunction y

structure DemandCorrespondence where
  priceSet : Type u
  wealthSet : Type u
  consumerPreference : ConsumerPreference
  budgetSet : consumerPreference.consumptionSet → consumerPreference.consumptionSet → Prop
  demand : consumerPreference.consumptionSet → Set (consumerPreference.consumptionSet)
  utilityMaximization : ∀ p : consumerPreference.consumptionSet, ∀ w : consumerPreference.consumptionSet,
    demand p w = { x : consumerPreference.consumptionSet | budgetSet x p ∧
      ∀ y : consumerPreference.consumptionSet, budgetSet y p → consumerPreference.preferenceRelation x y }

structure ConsumerTheoryEvidence (C : ConsumerPreference) where
  completenessClosed : C.completeness
  transitivityClosed : C.transitivity
  continuityClosed : C.continuity
  localNonSatiationClosed : C.localNonSatiation
  strictConvexityClosed : C.strictConvexity

def ConsumerTheoryClosed (C : ConsumerPreference) : Prop :=
  C.completeness ∧ C.transitivity ∧ C.continuity ∧ C.localNonSatiation ∧ C.strictConvexity

theorem consumer_theory_closed_from_evidence (C : ConsumerPreference) (E : ConsumerTheoryEvidence C) :
    ConsumerTheoryClosed C := by
  exact And.intro E.completenessClosed
    (And.intro E.transitivityClosed
      (And.intro E.continuityClosed
        (And.intro E.localNonSatiationClosed E.strictConvexityClosed)))

end EconomicsMicroeconomicTheoryCanonicalLaneLean
end HautevilleHouse