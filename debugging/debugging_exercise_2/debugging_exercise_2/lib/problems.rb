# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

require "byebug"

def prime?(p)
    return false if p < 2 
    (2...p).none? { |factor| p % factor == 0 }
end

def devisors(num)
    (2..num).select { |d| num % d == 0 }
end

def largest_prime_factor(num)
    primes = (0..num).select { |m| prime?(m) }
    divisors = devisors(num)
    intersect = divisors & primes
    data = {
        divisors: divisors,
        primes: primes,
        intersect: intersect,
        largest_divisor_and_prime: intersect.max 
    }
    return intersect.max
end

def unique_chars?(str)
    original = str.split("")
    unique = str.split("").uniq
    original == unique
end

def dupe_indices(arr)
    myHash = Hash.new { |h,k| h[k]=[] }
    arr.each.with_index { |char,i| myHash[char] << i }
    myHash.select { |k,v| v.length > 1 }
end

p dupe_indices(["a","a",1,2,3])


def both_have_same_common_elements?(arr1,arr2)
    arr1.all? { |a1| arr2.include? a1 } && arr2.all? { |a2| arr1.include? a2 }
end


def ana_array(arr1,arr2)
    if arr1 == arr2
        return false
    end

    both_have_same_common_elements?(arr1,arr2)
end

