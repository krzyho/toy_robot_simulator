class ExitCommand
  def valid?(_, _)
    true
  end

  def execute(_)
    exit
  end
end
