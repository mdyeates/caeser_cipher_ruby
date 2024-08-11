class CaesarCipher
  ALPHABET_SIZE = 26
  LOWER_CASE = 'a'..'z'
  UPPER_CASE = 'A'..'Z'


  def initialize(text, shift, mode = :encrypt)
    @text = text
    @shift = shift
    @mode = mode
  end

  def process
    @text.chars.map { |char| process_char(char) }.join
  end

  private

  def process_char(char)
    case char
    when UPPER_CASE
      shift_within_bounds(char, 'A')
    when LOWER_CASE
      shift_within_bounds(char, 'a')
    else
      char
    end
  end

  def shift_within_bounds(char, base)
    index = (char.ord - base.ord + shift_amount) % ALPHABET_SIZE
    (base.ord + index).chr
  end

  def shift_amount
    @mode == :encrypt ? @shift : -@shift
  end
end