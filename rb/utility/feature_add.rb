# Pokapi SDK utility: feature_add
module PokapiUtilities
  FeatureAdd = ->(ctx, f) {
    ctx.client.features << f
  }
end
