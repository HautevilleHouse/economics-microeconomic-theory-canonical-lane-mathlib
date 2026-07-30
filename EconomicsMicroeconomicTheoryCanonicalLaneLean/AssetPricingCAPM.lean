import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsMicroeconomicTheoryCanonicalLaneLean

structure AssetPricingCAPMPackage (A : AdmissibleClass) where
  riskFreeAsset : Type u
  riskyAssets : Type v
  expectedReturn : riskyAssets → ℝ
  varianceCovarianceMatrix : riskyAssets → riskyAssets → ℝ
  marketPortfolio : riskyAssets → ℝ
  beta : riskyAssets → ℝ
  securityMarketLine : Prop

structure AssetPricingCAPMEvidence {A : AdmissibleClass}
    (Pkg : AssetPricingCAPMPackage A) where
  securityMarketLineClosed : Pkg.securityMarketLine

def AssetPricingCAPMClosed {A : AdmissibleClass}
    (Pkg : AssetPricingCAPMPackage A) : Prop :=
  Pkg.securityMarketLine

theorem asset_pricing_capm_closed_from_evidence
    {A : AdmissibleClass} (Pkg : AssetPricingCAPMPackage A)
    (E : AssetPricingCAPMEvidence Pkg) : AssetPricingCAPMClosed Pkg := by
  exact E.securityMarketLineClosed

end EconomicsMicroeconomicTheoryCanonicalLaneLean
end HautevilleHouse