import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsMicroeconomicTheoryCanonicalLaneLean

structure ExternalityType where
  positive : Prop
  negative : Prop

structure PublicGood where
  nonrivalry : Prop
  nonexcludability : Prop

structure MarketFailurePackage where
  externality : ExternalityType
  publicGood : PublicGood
  asymmetricInformation : Prop

structure MarketFailureEvidence (M : MarketFailurePackage) where
  externalityClosed : M.externality.positive ∨ M.externality.negative
  publicGoodClosed : M.publicGood.nonrivalry ∧ M.publicGood.nonexcludability
  asymmetricInformationClosed : M.asymmetricInformation

def MarketFailureClosed (M : MarketFailurePackage) : Prop :=
  (M.externality.positive ∨ M.externality.negative) ∧
  (M.publicGood.nonrivalry ∧ M.publicGood.nonexcludability) ∧
  M.asymmetricInformation

theorem market_failure_closed_from_evidence (M : MarketFailurePackage)
    (E : MarketFailureEvidence M) : MarketFailureClosed M := by
  exact And.intro E.externalityClosed (And.intro E.publicGoodClosed E.asymmetricInformationClosed)

end EconomicsMicroeconomicTheoryCanonicalLaneLean
end HautevilleHouse