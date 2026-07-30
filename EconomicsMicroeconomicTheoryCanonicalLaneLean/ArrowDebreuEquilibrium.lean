import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsMicroeconomicTheoryCanonicalLaneLean

structure CommoditySpace where
  commodityTypes : Type u
  priceSystem : commodityTypes → ℝ
  priceNonnegative : ∀ l : commodityTypes, priceSystem l ≥ 0
  priceNonzero : ∃ l : commodityTypes, priceSystem l > 0

structure ProductionSet where
  inputOutputVector : Type u
  productionPossibilitySet : Set inputOutputVector
  closedness : Prop
  freeDisposal : Prop
  returnsToScale : Prop

structure Firm where
  productionSet : ProductionSet
  profitMaximization : ∀ p : CommoditySpace, ∀ y : productionSet.inputOutputVector,
    y ∈ productionSet.productionPossibilitySet →
    (∀ y' : productionSet.inputOutputVector, y' ∈ productionSet.productionPossibilitySet →
      p.priceSystem • y ≥ p.priceSystem • y')

structure Consumer where
  preference : ConsumerPreference
  endowment : preference.consumptionSet → ℝ
  shares : Firm → ℝ
  budgetConstraint : CommoditySpace → preference.consumptionSet → Prop
  utilityMaximization : ∀ p : CommoditySpace, ∀ x : preference.consumptionSet,
    budgetConstraint p x →
    (∀ y : preference.consumptionSet, budgetConstraint p y → preference.preferenceRelation x y)

structure ArrowDebreuEquilibrium where
  priceSystem : CommoditySpace
  allocation : (Consumer → Consumer.preference.consumptionSet) × (Firm → Firm.productionSet.inputOutputVector)
  marketClearing : ∀ l : priceSystem.commodityTypes,
    (∑ (c : Consumer), allocation.1 c l) = (∑ (c : Consumer), c.endowment l) + (∑ (f : Firm), allocation.2 f l)
  consumerOptimality : ∀ c : Consumer, c.utilityMaximization priceSystem (allocation.1 c)
  firmOptimality : ∀ f : Firm, f.profitMaximization priceSystem (allocation.2 f)

structure ArrowDebreuEvidence where
  equilibrium : ArrowDebreuEquilibrium
  priceNonnegativeClosed : equilibrium.priceSystem.priceNonnegative
  priceNonzeroClosed : equilibrium.priceSystem.priceNonzero
  marketClearingClosed : equilibrium.marketClearing
  consumerOptimalityClosed : equilibrium.consumerOptimality
  firmOptimalityClosed : equilibrium.firmOptimality

def ArrowDebreuEquilibriumClosed (A : ArrowDebreuEquilibrium) : Prop :=
  A.priceSystem.priceNonnegative ∧ A.priceSystem.priceNonzero ∧ A.marketClearing ∧
  A.consumerOptimality ∧ A.firmOptimality

theorem arrow_debreu_equilibrium_closed_from_evidence (A : ArrowDebreuEquilibrium) (E : ArrowDebreuEvidence) :
    ArrowDebreuEquilibriumClosed A := by
  exact And.intro E.priceNonnegativeClosed
    (And.intro E.priceNonzeroClosed
      (And.intro E.marketClearingClosed
        (And.intro E.consumerOptimalityClosed E.firmOptimalityClosed)))

end EconomicsMicroeconomicTheoryCanonicalLaneLean
end HautevilleHouse