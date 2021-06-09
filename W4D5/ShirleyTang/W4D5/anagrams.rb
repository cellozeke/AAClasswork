def first_anagram?(str1,str2)
    str1.chars.permutation.to_a.map(&:join).include?(str2)
end

str1='app'
str2='ppa'
str3='bad'
p first_anagram?(str1,str2) # O(n!)
p first_anagram?(str1,str3)

def second_anagram?(str1,str2)
    str1.each_char do |char|
        if str2.include?(char)
            idx= str2.index(char)
            str2=str2[0...idx]+str2[idx+1..-1]
        else
            return false
        end
    end
    str2.empty?
end

p second_anagram?(str1,str2) # O(n^3)
p second_anagram?(str1,str3)

def third_anagram?(str1, str2)
    str1.chars.sort == str2.chars.sort
end

p third_anagram?(str1, str2)
p third_anagram?(str1, str3)

def fourth_anagram?(str1, str2)
    count1 = Hash.new(0)
    count2 = Hash.new(0)
    str1.each_char { |char| count1[char] += 1 }
    str2.each_char { |char| count2[char] += 1 }
    count1 == count2
end

p fourth_anagram?(str1, str2) # O(n)
p fourth_anagram?(str1, str3)

def bonus_anagram?(str1, str2)
    count = Hash.new(0)
    str1.each_char { |char| count[char] += 1 }
    str2.each_char { |char| count[char] -= 1 }
    count.values.all?(&:zero?)
end

p bonus_anagram?(str1, str2) # O(n)
p bonus_anagram?(str1, str3)
