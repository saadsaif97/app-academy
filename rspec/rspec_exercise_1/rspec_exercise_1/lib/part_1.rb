def average(a,b)
    (a+b)/2.to_f
end


def average_array(arr)
    arr.sum.to_f/arr.length
end

def repeat(str,num)
    newStr = ""
    (1..num).each { newStr += str }
    newStr
end

p repeat("hello",3)

def yell(str)
    str.upcase+"!"
end

def alternating_case(str)
    myStr = []
    explodedArr = str.split
    explodedArr.each_with_index  do |el,i|
        if (i % 2 == 0)
            myStr << el.upcase
        else
            myStr << el.downcase
        end
    end
    myStr.join(" ")
end
