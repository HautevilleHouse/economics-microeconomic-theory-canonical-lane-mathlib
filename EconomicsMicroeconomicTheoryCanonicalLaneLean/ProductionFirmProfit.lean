import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsMicroeconomicTheoryCanonicalLaneLean

structure ProductionFirmProfitPackage where
  productionSet : Type u
  priceVector : Type v
  costFunction : Type w
  profitFunction : productionSet → ℝ
  profitMaximization : Prop
  optimalOutput : productionSet

structure ProductionFirmProfitEvidence (P : ProductionFirmProfitPackage) where
  profitMaximizationClosed : P.profitMaximization
  optimalOutputClosed : P.optimalOutput ∈ P.productionSet
  profitNonNegative : P.profitFunction P.optimalOutput ≥ 0

def ProductionFirmProfitClosed (P : ProductionFirmProfitPackage) : Prop :=
  P.profitMaximization ∧ (P.optimalOutput ∈ P.productionSet) ∧ (P.profitFunction P.optimalOutput ≥ 0)

theorem production_firm_profit_closed_from_evidence
    (P : ProductionFirmProfitPackage) (E : ProductionFirmProfitEvidence P) :
    ProductionFirmProfitClosed P := by
  exact And.intro E.profitMaximizationClosed
    (And.intro E.optimalOutputClosed E.profitNonNegative)

end EconomicsMicroeconomicTheoryCanonicalLaneLean
end HautevilleHouse