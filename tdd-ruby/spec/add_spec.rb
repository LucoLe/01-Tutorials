require_relative "../lib/add.rb"
describe "add function" do
  it "adds two numbers" do
    expect(add(1,5)).to eq(6)
  end
end