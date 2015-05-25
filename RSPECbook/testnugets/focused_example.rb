RSpec.configure do |c|
  c.filter = { focus: true }
  c.exclusion_filter = { slow: true }
end

describe "group 1", focus: true do
  it "example 1" do
  end

  it "example 2" do
  end
end
describe "group 2" do
  it "example 3" do
  end

  it "example 4" do
  end
end
describe "group 3", focus: true do
  it "example 1", slow: true do
  end

  it "example 2" do
  end
end