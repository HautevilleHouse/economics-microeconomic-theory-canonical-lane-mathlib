import canonicalLaneMathlib.GateLemmas

namespace HautevilleHouse
namespace EconomicsMicroeconomicTheoryCanonicalLaneLean

def ConstrainedEconomicsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_economics_endgame (A : AdmissibleClass) :
    ConstrainedEconomicsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end EconomicsMicroeconomicTheoryCanonicalLaneLean
end HautevilleHouse
