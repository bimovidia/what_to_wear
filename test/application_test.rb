# To change this template, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'application'

class ApplicationTest < Test::Unit::TestCase
  def setup
    @instance = ApplicationController.new
  end

  def test_get_woeid
    expected = '2383660'
    result = @instance.getWOEID('Columbus, Ohio')
    assert_equal(expected, result)
  end

  def test_get_weather

  end
end
