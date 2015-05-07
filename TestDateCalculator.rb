require_relative "DateCalculator"
require "minitest/autorun"

class TestDateCalculator < Minitest::Test
    def helper_leapyear(year)
       calc = DateCalculator.new(0)
      calc.year = year
      return calc.leap_year?
    end

    def test_leapyear
	# It should occur every 4 years
	assert helper_leapyear(2004)
	
	# But not every 100 years
	assert_false helper_leapyear(1900)

	# But should every 400 years
	assert helper_leapyear(2000)
    end


  def help_addleapyear(days, year)
		calc = DateCalculator.new(days)
		calc.year = year
		calc.add_leap_year
	return calc.year
	end


	def test_addleapyear
	# It should not peel off leap year if not enough days left
	assert_equal help_addleapyear(255,2008), 2008
	# It should peel off leap year if >1 year of days left
	assert_equal help_addleapyear(400,2008), 2009
	# It should peel off leap year if exactly 1 year of days left
	assert_equal help_addleapyear(366,2008), 2009
	end


	def help_addregularyear(days, year)
		calc = DateCalculator.new(days)
		calc.year = year
		calc.add_regular_year
		return calc.year
	end


def test_addregularyear
# It should not peel off regular year if not enough days left
assert_equal help_addregularyear(255,2009), 2009
# It should peel off regular year if >1 year of days left
assert_equal help_addregularyear(400,2009), 2010
# It should peel off regular year if exactly 1 year of days left
assert_equal help_addregularyear(365,2009), 2010
end



def help_convert(days, year)
	calc = DateCalculator.new(days)
	calc.year = year
	return calc.convert
end


def test_convert
# It should return same with initial regular year if <1 year of days left
assert_equal help_convert(364, 2009), 2009
# It should return same with initial leap year if <1 year of days left
assert_equal help_convert(365, 2008), 2008
# It should return initial regular year + 1 if 1 year of days left
assert_equal help_convert(365, 2009), 2010
# It should return initial leap year + 1 if 1 leap year of days left
assert_equal help_convert(366, 2008), 2009
# It should return initial regular year + 1 if >1 year of days left
assert_equal help_convert(366, 2009), 2010
#It should return initial leap year + 1 if >1 leap year of days left
assert_equal help_convert(367, 2008), 2009
end




end
