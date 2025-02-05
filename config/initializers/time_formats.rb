Time::DATE_FORMATS[:ordinal] = lambda { |time| time.strftime("%B #{time.day.ordinalize}") }
