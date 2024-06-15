def letter?(input) #Checks if input is a letter
    input.match?(/[[:alpha:]]/)
end

WRAP_AROUND = 26   #Subtract by 26 since there are 26 letters in the alphabet

def caesar_cipher(text, shift)
    ascii_array = []
    convert_ascii = text.split("").each do |char|
        if letter?(char)
            char = char.ord + shift     #.ord converts to ascii int
            if char > 90 && char < 97   #Checks if char needs to wrap back from Z to A (uppercase)
                char = char - WRAP_AROUND
            end
            if char > 122               #Checks if char needs to wrap back from z to a (lowercase)
                char = char - WRAP_AROUND
            end
        end
        ascii_array.push(char.chr)      #.chr converts to alphabet string
    end
    final = ascii_array.join

    return final
end

puts caesar_cipher("What a string! ze~", 5)
