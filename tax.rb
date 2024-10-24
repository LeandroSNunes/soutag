module Tax
  def self.find(state)
    {
      'MG' => 10,
      'ES' => 0
    }.fetch(state.upcase, 0)
  end
end
