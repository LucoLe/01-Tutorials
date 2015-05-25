class Player
  attr_accessor :twitter
  def initialize name, *args
    @name = name
    if args.size != 0 && args[0][:twitter]
      @twitter = args[0][:twitter]
    end
  end
end