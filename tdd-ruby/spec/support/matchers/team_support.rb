RSpec::Matchers.define :allow_teams_to_enter do |expected|
  match do |actual|
    begin
      Team.new("Random name").enter_competition actual
      true
    rescue Competition::Closed
      false
    end
  end

  failure_message do |actual|
    "expected that #{actual} would indeed allow team to enter"
  end

  failure_message_when_negated do |actual|
    "expected that #{actual} would not allow team to enter"
  end
end