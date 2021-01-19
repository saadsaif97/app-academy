
def partition(arr,num)
    lessThan = []
    greaterThan = []
    arr.each { |n| n < num ? lessThan<<n : greaterThan<<n }
    [lessThan,greaterThan]
end

def merge(hash_1,hash_2)
    hash_1.merge(hash_2)
end

def star_vowels(word)
    word.gsub(/[aeiouAEIOU]/,"*")
end

def censor(str,curse_words)
    words = str.split("")
    newStr = words.map do |word|
        if curse_words.include?(word.downcase)
            star_vowels(word)
        else 
            word
        end
    end
    newStr.join
end

p censor("SHUT THE FRONT DOOR", ["door"])

def power_of_two?(num)
    if (num == 1)
        return true
    end
    while true
        num = num / 2
        if num <= 2
            return num==2
        end
    end
end
