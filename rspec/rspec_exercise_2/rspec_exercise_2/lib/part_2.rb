def palindrome?(str)
    str.each_char.with_index do |char,i|
        if char!=str[-1-i]
            return false
        end
    end
    true
end


def substrings(str)
    subStrs = []
    (0...str.length).each do |start_idx|
        (0...str.length).each do |end_idx|
            if start_idx <= end_idx
                subStrs << str[start_idx..end_idx]
            end
        end
    end
    subStrs
end

def palindrome_substrings(str)
    substrings(str).select { |subStr| palindrome?(subStr) && subStr.length > 1 }
end

p palindrome_substrings("abadasd")