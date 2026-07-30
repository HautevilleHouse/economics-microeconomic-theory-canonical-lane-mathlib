import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsMicroeconomicTheoryCanonicalLaneLean

structure GrowthModelSolowPackage (A : AdmissibleClass) where
  productionFunction : ℝ → ℝ → ℝ
  capitalAccumulation : ℝ → ℝ → ℝ
  savingsRate : ℝ
  depreciationRate : ℝ
  steadyStateCapital : ℝ
  convergenceCondition : Prop

structure GrowthModelSolowEvidence {A : AdmissibleClass}
    (Pkg : GrowthModelSolowPackage A) where
  convergenceConditionClosed : Pkg.convergenceCondition

def GrowthModelSolowClosed {A : AdmissibleClass}
    (Pkg : GrowthModelSolowPackage A) : Prop :=
  Pkg.convergenceCondition

theorem growth_model_solow_closed_from_evidence
    {A : AdmissibleClass} (Pkg : GrowthModelSolowPackage A)
    (E : GrowthModelSolowEvidence Pkg) : GrowthModelSolowClosed Pkg := by
  exact E.convergenceConditionClosed

end EconomicsMicroeconomicTheoryCanonicalLaneLean
end HautevilleHouse