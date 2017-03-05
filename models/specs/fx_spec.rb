require('minitest/autorun')
require('minitest/rg')
require_relative('../fx')

class FxSpec < Minitest::Test

def setup
  @fx = Fx.new("GBP", "USD")
end

def test_fx_has_params
  assert_equal("GBP + USD", @fx.display_params())
end

# def test_multiplier_will_work
  
#   result = @fx.calculate_fx_multiplier("GBP", "USD")
#   assert_equal("USD", result)
# end

end