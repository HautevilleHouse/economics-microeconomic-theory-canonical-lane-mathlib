import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsMicroeconomicTheoryCanonicalLaneLean

structure UtilityRepresentationPackage where
  consumptionSet : Type u
  preferenceRelation : Type v
  utilityFunction : consumptionSet → ℝ
  completeness : Prop
  transitivity : Prop
  continuity : Prop
  monotonicity : Prop
  utilityRepresentation : Prop

structure UtilityRepresentationEvidence (U : UtilityRepresentationPackage) where
  completenessClosed : U.completeness
  transitivityClosed : U.transitivity
  continuityClosed : U.continuity
  monotonicityClosed : U.monotonicity
  utilityRepresentationClosed : U.utilityRepresentation

def UtilityRepresentationClosed (U : UtilityRepresentationPackage) : Prop :=
  U.completeness ∧ U.transitivity ∧ U.continuity ∧ U.monotonicity ∧ U.utilityRepresentation

theorem utility_representation_closed_from_evidence
    (U : UtilityRepresentationPackage) (E : UtilityRepresentationEvidence U) :
    UtilityRepresentationClosed U := by
  exact And.intro E.completenessClosed
    (And.intro E.transitivityClosed
      (And.intro E.continuityClosed
        (And.intro E.monotonicityClosed E.utilityRepresentationClosed)))

end EconomicsMicroeconomicTheoryCanonicalLaneLean
end HautevilleHouse