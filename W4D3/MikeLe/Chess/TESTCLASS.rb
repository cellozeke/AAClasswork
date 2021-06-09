require_relative 'TESTMODULE'

class TestClass
  include TestMod
  attr_reader :name
  def initialize
    @name = 'alvin'
  end
end
