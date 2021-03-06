class Gear
  attr_reader :chainring, :cog, :wheel, :observer
  def initialize(args)
    @chainring = args[:chainring]
    @cog       = args[:cog]
    @wheel     = args[:wheel]
    @observer  = args[:observer]
  end
  # ...
  def set_cog(new_cog)
    @cog = new_cog
    changed
  end

  def set_chainring(new_chainring)
    @chainring = new_chainring
    changed
  end

  def changed # ギアを変えるたびに、observerに変更を知らせる
    observer.changed(chainring, cog)
  end
end