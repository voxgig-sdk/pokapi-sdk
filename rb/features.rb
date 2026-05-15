# Pokapi SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/test_feature'


module PokapiFeatures
  def self.make_feature(name)
    case name
    when "base"
      PokapiBaseFeature.new
    when "test"
      PokapiTestFeature.new
    else
      PokapiBaseFeature.new
    end
  end
end
