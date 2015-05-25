require 'cucumber/rspec/doubles'
require_relative "../../lib/team.rb"
require_relative "../../lib/competition.rb"

Given /There is a team called "([^"]*)"/ do |name|
  @team = Team.new name
end

Given /I have a competition with( no)? questions/ do |no_questions|
  @competition = Competition.new
  if no_questions
    @competition.stub questions: []
  else
    @competition.stub questions: [ "Primer" ]
  end

end
When /a team enters the competiotion/ do
  @method = -> { @team.enter_competition @competition }
end
Then /I should( not)? see an error/ do |dont_raise|
  if dont_raise
    @method.should_not raise_error
  else
    @method.should raise_error Competition::Closed
  end
end