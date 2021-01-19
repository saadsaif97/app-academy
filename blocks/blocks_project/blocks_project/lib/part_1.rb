
def select_even_nums(arr) 
    arr.select(&:even?)
end

def reject_puppies(obj)
    obj.reject { |dog| dog["age"] <= 2 }
end

def count_positive_subarrays(array)
    array.count { |arr| arr.sum > 0 }
end

def aba_translate(word)
    arr = word.each_char.map { |char| char.match(/[aeiou]/) ? "#{char}b#{char}" : char }
    arr.join
end

def aba_array(arr)
    arr.map { |word| aba_translate(word) }
end
