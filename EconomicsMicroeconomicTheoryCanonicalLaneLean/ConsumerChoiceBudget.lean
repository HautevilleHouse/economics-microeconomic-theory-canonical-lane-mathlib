import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsMicroeconomicTheoryCanonicalLaneLean

structure ConsumerChoiceBudgetPackage where
  consumptionSet : Type u
  priceVector : Type v
  income : ℝ
  budgetSet : Set consumptionSet
  nonSatiation : Prop
  budgetConstraintSatisfied : Prop
  optimalChoice : consumptionSet

structure ConsumerChoiceBudgetEvidence (C : ConsumerChoiceBudgetPackage) where
  nonSatiationClosed : C.nonSatiation
  budgetConstraintSatisfiedClosed : C.budgetConstraintSatisfied
  optimalChoiceClosed : C.optimalChoice ∈ C.budgetSet

def ConsumerChoiceBudgetClosed (C : ConsumerChoiceBudgetPackage) : Prop :=
  C.nonSatiation ∧ C.budgetConstraintSatisfied ∧ (C.optimalChoice ∈ C.budgetSet)

theorem consumer_choice_budget_closed_from_evidence
    (C : ConsumerChoiceBudgetPackage) (E : ConsumerChoiceBudgetEvidence C) :
    ConsumerChoiceBudgetClosed C := by
  exact And.intro E.nonSatiationClosed
    (And.intro E.budgetConstraintSatisfiedClosed E.optimalChoiceClosed)

end EconomicsMicroeconomicTheoryCanonicalLaneLean
end HautevilleHouse