import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsMicroeconomicTheoryCanonicalLaneLean

structure StochasticDiscountFactor where
  states : Type u
  probabilities : states → ℝ
  discountFactor : states → ℝ
  positive : ∀ s, discountFactor s > 0

structure AssetPricingModel (S : StochasticDiscountFactor) where
  assetPayoffs : Type v → (v → ℝ)
  price : (v → ℝ) → ℝ
  lawOfOnePrice : Prop
  noArbitrage : Prop

def AssetPricingClosed (S : StochasticDiscountFactor) (A : AssetPricingModel S) : Prop :=
  A.noArbitrage ∧ A.lawOfOnePrice

theorem asset_pricing_closed_from_evidence
    (S : StochasticDiscountFactor) (A : AssetPricingModel S)
    (hNoArbitrage : A.noArbitrage) (hLaw : A.lawOfOnePrice) :
    AssetPricingClosed S A := by
  exact And.intro hNoArbitrage hLaw

end EconomicsMicroeconomicTheoryCanonicalLaneLean
end HautevilleHouse
