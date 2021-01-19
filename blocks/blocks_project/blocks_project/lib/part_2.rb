def all_words_capitalized?(words)
    words.all? { |word| word.capitalize == word  }
end

def no_valid_url?(urls)
    valid_endings = ['.com', '.net', '.io','.org']

    urls.none? { |url| valid_endings.any? { |ending| url.end_with?(ending) } }

end

def any_passing_students?(students)
    students.any? { |student| (student[:grades].sum/student[:grades].length) > 75 }
end

        students_1 = [
          { name: "Alvin", grades: [70, 50, 75] },
          { name: "Warlin", grades: [80, 99, 95] },
          { name: "Vlad", grades: [100] },
        ]

        students = [
          { name: "Alice", grades: [60, 68] },
          { name: "Bob", grades: [20, 100] }
        ]

p any_passing_students?(students_1)
p any_passing_students?(students)