require "byebug"

def reverser(str, &prc)
    prc.call(str.reverse)
end

def word_changer(words, &prc)
    arr = words.split(' ').map { |word| prc.call(word) }
    arr.join(" ")
end

def greater_proc_value(num, prc1, prc2)
    val1 = prc1.call(num) 
    val2 = prc2.call(num) 
    val1 > val2 ? val1 : val2
end

def and_selector(arr, prc1, prc2)
    arr1 = arr.select { |el| prc1.call(el) }
    arr2 = arr.select { |el| prc2.call(el) }
    arr1 & arr2
end

def alternating_mapper(arr, prc1, prc2)
    arr.map.with_index do |el,i|
        if i % 2 == 0
            prc1.call(el)
        else
            prc2.call(el)
        end
    end
end