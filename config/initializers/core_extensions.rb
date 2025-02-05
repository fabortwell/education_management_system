class Integer
  def ordinalize
    ActiveSupport::Inflector.ordinalize(self)
  end
end
