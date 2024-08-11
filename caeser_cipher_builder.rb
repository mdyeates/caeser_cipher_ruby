class CaesarCipherBuilder
  def self.builder
    new
  end

  def initialize
    @text = ""
    @shift = 0
    @mode = :encrypt 
  end

  def with_text(text)
    @text = text
    self
  end

  def with_shift(shift)
    @shift = shift
    self
  end

  def encrypt
    @mode = :encrypt
    self
  end

  def decrypt
    @mode = :decrypt
    self
  end

  def build
    validate_inputs
    CaesarCipher.new(@text, @shift, @mode).process
  end

  private

  def validate_inputs
    raise ArgumentError, "Text must be a non-empty string" if @text.empty?
    raise ArgumentError, "Shift must be an integer" unless @shift.is_a?(Integer)
    raise ArgumentError, "Shift must be non-negative" if @shift < 0
  end
end