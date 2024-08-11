require_relative "caeser_cipher"
require_relative "caeser_cipher_builder"

encrypted_text = CaesarCipherBuilder.builder
                        .with_text("Hello, World!")
                        .with_shift(75)
                        .encrypt
                        .build

decrypted_text = CaesarCipherBuilder.builder
                        .with_text(encrypted_text)
                        .with_shift(75)
                        .decrypt
                        .build

puts "Encrypted: #{encrypted_text}"
puts "Decrypted: #{decrypted_text}"

