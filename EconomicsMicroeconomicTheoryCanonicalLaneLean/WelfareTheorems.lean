import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsMicroeconomicTheoryCanonicalLaneLean

structure WelfareTheoremsPackage where
  equilibriumAllocation : Type u
  paretoOptimalAllocation : Type v
  firstWelfareTheorem : Prop
  secondWelfareTheorem : Prop
  paretoOptimalImplied : Prop

structure WelfareTheoremsEvidence (W : WelfareTheoremsPackage) where
  firstWelfareTheoremClosed : W.firstWelfareTheorem
  secondWelfareTheoremClosed : W.secondWelfareTheorem
  paretoOptimalImpliedClosed : W.paretoOptimalImplied

def WelfareTheoremsClosed (W : WelfareTheoremsPackage) : Prop :=
  W.firstWelfareTheorem ∧ W.secondWelfareTheorem ∧ W.paretoOptimalImplied

theorem welfare_theorems_closed_from_evidence
    (W : WelfareTheoremsPackage) (E : WelfareTheoremsEvidence W) :
    WelfareTheoremsClosed W := by
  exact And.intro E.firstWelfareTheoremClosed
    (And.intro E.secondWelfareTheoremClosed E.paretoOptimalImpliedClosed)

end EconomicsMicroeconomicTheoryCanonicalLaneLean
end HautevilleHouse