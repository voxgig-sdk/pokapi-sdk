# Pokapi SDK utility: make_context
require_relative '../core/context'
module PokapiUtilities
  MakeContext = ->(ctxmap, basectx) {
    PokapiContext.new(ctxmap, basectx)
  }
end
