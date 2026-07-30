import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsMicroeconomicTheoryCanonicalLaneLean

structure MarketAggregationPackage where
  consumers : List (Type u)
  firms : List (Type v)
  commoditySpace : Type w
  priceSystem : Type x
  aggregateDemand : commoditySpace
  aggregateSupply : commoditySpace
  marketClearingCondition : Prop
  walrasLaw : Prop

structure MarketAggregationEvidence (M : MarketAggregationPackage) where
  marketClearingConditionClosed : M.marketClearingCondition
  walrasLawClosed : M.walrasLaw
  aggregateDemandFinite : M.aggregateDemand ≠ ∅
  aggregateSupplyFinite : M.aggregateSupply ≠ ∅

def MarketAggregationClosed (M : MarketAggregationPackage) : Prop :=
  M.marketClearingCondition ∧ M.walrasLaw ∧ M.aggregateDemand ≠ ∅ ∧ M.aggregateSupply ≠ ∅

theorem market_aggregation_closed_from_evidence
    (M : MarketAggregationPackage) (E : MarketAggregationEvidence M) :
    MarketAggregationClosed M := by
  exact And.intro E.marketClearingConditionClosed
    (And.intro E.walrasLawClosed
      (And.intro E.aggregateDemandFinite E.aggregateSupplyFinite))

end EconomicsMicroeconomicTheoryCanonicalLaneLean
end HautevilleHouse