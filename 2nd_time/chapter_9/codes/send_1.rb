class Gear
  attr_reader :chainring, :cog, :wheel, :observer
  def initialize(args)
    @chainring = args[:chainring]
    @cog       = args[:cog]
    @wheel     = args[:wheel]
    @observer  = args[:observer]
  end

  def set_cog(new_cog)
    @cog = new_cog # 外から変えられないようにするためか
    changed
  end

  def set_chainring(new_chainring)
    @chainring = new_chainring
    changed
  end

  def changed
    observer.changed(chainring, cog) # 別のオブジェクトにメッセージを送った、っていうのもコマンドメッセージに分類するんだ。値が変わってなくても。
  end
end