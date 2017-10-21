require_relative 'test_helper'
require "./lib/encryptor"

class EncryptorTest < Minitest::Test

  def test_it_can_square_the_last_four
    encrypt = Encryptor.new("wly34flv3klp", "12345", 191017)
    encrypt.find_last_four

    assert_equal ["4","2","8","9"], encrypt.find_last_four
  end

  def test_it_can_add_key_to_offset
    encrypt = Encryptor.new("wly34flv3klp", "12345")
    rotations = [16, 25, 42, 54]

    assert_equal rotations, encrypt.rotation
  end

  def test_it_can_find_letter_indeces
  letter_indeces = [23, 12, 25, 29, 30, 6, 12, 22, 29, 11, 12, 16]
  encrypt = Encryptor.new("wly34flv3klp","12345")
  encrypt.rotation

  assert_equal letter_indeces, encrypt.code_to_index
  end

  def test_it_can_subtract_letter_index_from_rotation

    letter_indeces = [12, 1, 11, 19, 4, 13]
    decrypt = Encryptor.new("laksdm", "34543")
    decrypt.rotation
    decrypt.code_to_index

    assert_equal letter_indeces , decrypt.subtract_offset
  end

  def test_it_can_encrypt
    encryption = "nfc5u3xte3r"
    encrypt = Encryptor.new("hello..end..", "54321")
    encrypt.rotation
    encrypt.code_to_index
    encrypt.add_offset

    assert_equal encryption, encrypt.crypt

  end

  def test_it_can_decrypt
    decryption = "yo yo my bud bud..end.."
    decrypt = Encryptor.new("vz4mlifm8mn58mn59j baj5", "23423")
    decrypt.rotation
    decrypt.code_to_index
    decrypt.subtract_offset

    assert_equal decryption, decrypt.crypt
  end

end
