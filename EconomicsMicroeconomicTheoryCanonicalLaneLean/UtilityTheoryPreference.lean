import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsMicroeconomicTheoryCanonicalLaneLean

structure UtilityTheoryPackage (A : AdmissibleClass) where
  consumptionSet : Type u
  preferenceRelation : A.object → consumptionSet → consumptionSet → Prop
  completeness : Prop
  transitivity : Prop
  continuity : Prop
  localNonSatiation : Prop
  utilityFunction : A.object → (consumptionSet → ℝ)
  representation : Prop

structure UtilityTheoryEvidence {A : AdmissibleClass}
    (Pkg : UtilityTheoryPackage A) where
  completenessClosed : Pkg.completeness
  transitivityClosed : Pkg.transitivity
  continuityClosed : Pkg.continuity
  localNonSatiationClosed : Pkg.localNonSatiation
  representationClosed : Pkg.representation

def UtilityTheoryClosed {A : AdmissibleClass}
    (Pkg : UtilityTheoryPackage A) : Prop :=
  Pkg.completeness ∧ Pkg.transitivity ∧ Pkg.continuity ∧
  Pkg.localNonSatiation ∧ Pkg.representation

theorem utility_theory_closed_from_evidence
    {A : AdmissibleClass} (Pkg : UtilityTheoryPackage A)
    (E : UtilityTheoryEvidence Pkg) : UtilityTheoryClosed Pkg := by
  exact And.intro E.completenessClosed
    (And.intro E.transitivityClosed
      (And.intro E.continuityClosed
        (And.intro E.localNonSatiationClosed E.representationClosed)))

end EconomicsMicroeconomicTheoryCanonicalLaneLean
end HautevilleHouse