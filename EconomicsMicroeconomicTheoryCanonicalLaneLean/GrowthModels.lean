import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsMicroeconomicTheoryCanonicalLaneLean

structure SolowModel where
  output : ℝ → ℝ
  capital : ℝ → ℝ
  labor : ℝ → ℝ
  savingsRate : ℝ
  depreciationRate : ℝ
  productionFunction : ℝ → ℝ → ℝ
  capitalAccumulation : dk/dt = savingsRate * output - depreciationRate * capital

structure RamseyCassKoopmans where
  householdUtility : ℝ → ℝ
  capitalAccumulation : dk/dt = f(k) - c - (n + g + δ)k
  consumptionEuler : dc/dt = (f'(k) - ρ - θ g) c / θ
  transversalityCondition : lim_{t→∞} k(t) exp(-∫_0^t (f'(k(s)) - δ) ds) = 0

structure EndogenousGrowthModel where
  humanCapital : ℝ → ℝ
  technologyA : ℝ → ℝ
  researchSector : ℝ → ℝ
  knowledgeAccumulation : dA/dt = δ L_A A^φ
  finalOutput : Y = K^α (A L_Y)^(1-α)

lemma steady_state_existence : ∀ model : SolowModel, ∃ k_star, dk/dt = 0 := ...

end EconomicsMicroeconomicTheoryCanonicalLaneLean
end HautevilleHouse