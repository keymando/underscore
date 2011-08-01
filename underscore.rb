class Underscore < Plugin

  @state = :disabled

  class << self; attr_accessor :state; end

  def self.enable
    @state = :enabled
  end

  def self.disable
    @state = :disabled
  end

  def self.enabled?
    lambda{Underscore.state == :enabled}
  end

  def self.disabled?
    lambda{Underscore.state == :disabled}
  end

  def after
    map ' ', '_', :if => Underscore.enabled?

    map("<Cmd-u>", :if => Underscore.disabled?) { Underscore.enable }
    map("<Escape>", :if => Underscore.enabled?) { Underscore.disable }
  end

end
