def letter?(input)
    input.match?(/[[:alpha:]]/)
end

def number?(input)
    input.match?(/[[:digit:]]/)
end

def caesar_cipher(text, shift)
    #select_ascii = text.split("").select {|char| letter?(char)}.join
    #convert_ascii = select_ascii.chars.map {|char| char.ord}

    #select_ascii = text.split("").select {|char| letter?(char)}.map {|char| char.ord}

    ascii_array = []
    convert_ascii = text.split("").each do |char|
        if letter?(char)
            char = char.ord + 5
            if char > 90 && char < 97
                char = char - 26
            end
            if char > 122
                char = char - 26
            end
        end
        ascii_array.push(char.chr)
    end
    final = ascii_array.join

    #final = convert_ascii.map {|char| char.chr}.map

    #puts ascii
    #shift_ascii = convert_ascii.map {|char| char + 5}
    #puts shift_ascii
    #final = shift_ascii.map {|char| char.chr}.join
    #puts
    return final
end

puts caesar_cipher("What a string! ze~", 5)
