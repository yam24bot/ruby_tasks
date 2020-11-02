alphabet = "абвгдеёжзийклмнопрстуфхцчшщъыьэюя"
letters= "аеёиоуыэюя"
letters_hash = {}

letters.each_char {|letter| letters_hash[letter] = alphabet.index(letter) + 1}

print letters_hash
