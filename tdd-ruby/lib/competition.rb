class Competition
  attr_accessor :questions

  class Closed < StandardError
  end

  def start
    close
  end
end