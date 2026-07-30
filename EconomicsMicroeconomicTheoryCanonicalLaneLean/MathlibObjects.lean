import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace EconomicsMicroeconomicTheoryCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure EconomicsSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure EconomicsAdmittedObject where
  space : EconomicsSpace
  convexPreferences : Prop
  completeMarkets : Prop
  paretoOptimality : Prop
  conclusion : paretoOptimality

structure EconomicsEndgameState where
  object : EconomicsAdmittedObject

def EconomicsWitnessClosed (O : EconomicsAdmittedObject) : Prop :=
  O.paretoOptimality

end EconomicsMicroeconomicTheoryCanonicalLaneLean
end HautevilleHouse