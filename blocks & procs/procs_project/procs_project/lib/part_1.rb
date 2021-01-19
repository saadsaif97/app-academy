

def my_map(arr, &prc)
    new_arr = []
    arr.each { |el| new_arr << prc.call(el) }
    new_arr
end

def my_select(arr, &prc)
    new_arr = []
    arr.each { |el| prc.call(el) ? new_arr << el : nil }
    new_arr
end

def my_count(arr, &prc)
    count = 0
    arr.each { |el| prc.call(el) ? count += 1 : nil }
    count
end

def my_any?(arr, &prc)
    result = false
    arr.each do |el|
        if prc.call(el)
            return true 
        end
    end
    result
end

def my_all?(arr, &prc)
    result = true
    arr.each do |el|
        if prc.call(el)
            next
        else
            return false
        end
    end
    result
end

def my_none?(arr, &prc)
    result = true
    arr.each do |el|
        if prc.call(el)
            return false
        end
    end
    result
end
