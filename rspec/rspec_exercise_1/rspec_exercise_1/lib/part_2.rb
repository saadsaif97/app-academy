def hipsterfy(word)
    word.reverse.sub(/[aeiou]/, "").reverse
end


def vowel_counts(str)
    aCount = 0
    eCount = 0
    iCount = 0
    oCount = 0
    uCount = 0
    vowelInStr={}
    vowels = ["a","e","i","o","u"]
    compact = str.gsub(" ","")
    alphabets = compact.split("")
    alphabets.each do |alp| 
        if (vowels.include? alp.downcase)
            if(alp.downcase == "a")
            (vowelInStr[alp.downcase] = aCount+=1)
            elsif(alp.downcase == "e")
            (vowelInStr[alp.downcase] = eCount+=1)
            elsif(alp.downcase == "i")
            (vowelInStr[alp.downcase] = iCount+=1)
            elsif(alp.downcase == "o")
            (vowelInStr[alp.downcase] = oCount+=1)
            elsif(alp.downcase == "u")
            (vowelInStr[alp.downcase] = uCount+=1)
            end
        end 
    end
    vowelInStr
end

def caesar_cipher(mess,num)
    alphabets = ("a".."z").to_a
    words = mess.split("")
    newMess = words.each_with_index.map { |char,i| alphabets.include?(char) ? alphabets[ (alphabets.index(char) + num) % 26 ] : char }
    newMess.join
end
