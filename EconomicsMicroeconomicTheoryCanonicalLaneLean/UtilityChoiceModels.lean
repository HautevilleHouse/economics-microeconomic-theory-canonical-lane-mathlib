import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsMicroeconomicTheoryCanonicalLaneLean

structure ChoiceData where
  alternatives : Type
  feasibleSets : Set (Set alternatives)
  choiceFunction : Set alternatives → Set alternatives

structure RationalChoice (C : ChoiceData) where
  preferenceRelation : C.alternatives → C.alternatives → Prop
  completeness : ∀ x y, x ≠ y → (preferenceRelation x y) ∨ (preferenceRelation y x)
  transitivity : ∀ x y z, preferenceRelation x y → preferenceRelation y z → preferenceRelation x z
  choiceMatchesPreference : ∀ feasibleSet, feasibleSet ∈ C.feasibleSets →
    C.choiceFunction feasibleSet = {x ∈ feasibleSet | ∀ y ∈ feasibleSet, preferenceRelation x y}

structure LaggrarianUtility (R : ChoiceData) where
  utilityFunction : R.alternatives → ℝ
  utilityMaximizes : ∀ feasibleSet, feasibleSet ∈ R.feasibleSets →
    R.choiceFunction feasibleSet = argmax utilityFunction feasibleSet

end EconomicsMicroeconomicTheoryCanonicalLaneLean
end HautevilleHouse