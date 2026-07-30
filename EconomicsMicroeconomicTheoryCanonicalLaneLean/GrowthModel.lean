import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsMicroeconomicTheoryCanonicalLaneLean

structure SolowGrowthModel where
  capitalStock : ℝ → ℝ
  laborForce : ℝ → ℝ
  productionFunction : ℝ → ℝ → ℝ
  savingsRate : ℝ
  depreciationRate : ℝ
  steadyStateExists : Prop

structure GrowthModelEvidence (M : SolowGrowthModel) where
  steadyStateExistsClosed : M.steadyStateExists
  stability : Prop
  stabilityClosed : stability

def GrowthModelClosed (M : SolowGrowthModel) : Prop :=
  M.steadyStateExists ∧ M.savingsRate > 0

theorem growth_model_closed_from_evidence
    (M : SolowGrowthModel) (ev : GrowthModelEvidence M) :
    GrowthModelClosed M := by
  refine And.intro ev.steadyStateExistsClosed ?_
  linarith

end EconomicsMicroeconomicTheoryCanonicalLaneLean
end HautevilleHouse
