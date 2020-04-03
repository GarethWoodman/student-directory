# Helper method
def one_or_more?(students)
  students.count == 1 ? "student" : "students"
end

# Let's put all students into an array
def input_students
  # Exercise 7 - Ask for both name and cohort and check conditions
  def enter_info(instruction)
    # Do a loop until user inputs correct value
    while true do
      puts instruction
      # Exercise 10 - Use another method to get rid of last character
      input = gets.gsub("\n", "")
      # If input contains numbers (strings default to 0)
      if input.to_i != 0
        puts "Letters only"
        next
      end
      # Break loop if user has entered a valid value
      break unless input.empty?
      puts "No value entered"
    end
    input
  end
  # Create method for enter_age
  def enter_age(age)
    # Do a loop until user inputs correct value
    while true do
      puts "Please enter age"
      age = gets.chomp.to_i
      age < 18 || age > 99 ? "Not valid" : break
    end
    age
  end

  puts "Enter student information as prompted"
  # Create and empty array
  students = []
  # Loop through adding students
  while true do
    # Get the first name
    name = enter_info("Please enter name")
    # Exercise 5 - Add more information
    # Get cohort
    cohort = enter_info("Please enter month of cohort you are attending")
    # Get the age
    age = enter_age("Please enter age")
    # Get the country of birth
    country = enter_info("Please enter country of birth")
    # Add the student hash to the array
    students << {name: name, cohort: cohort, age: age, country: country}
    # Exercise 9 - Use singular or plural when appropiate
    puts "Now we have #{students.count} #{one_or_more?(students)}"
    # Prompt user if they want to add more students, otherwise break
    puts "Continue adding students? y/n (anything other than y will default to n)"
    break if gets.chomp.downcase != "y"

  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  # Exercise 12 - Set condition if no students in array
  return puts("No students to print") if students.empty?
  # Exercise 1 - Modify to print a number before each nane
  students.each_with_index do |student, i|
    print_student  = "#{i+1} #{student[:name]} "
    print_student += "(#{student[:cohort]} cohort), "
    print_student += "Age: #{student[:age]}, "
    print_student += "Birth Place: #{student[:country]} "
    # Exercise 6 - Use method center
    puts print_student.center(80, '# ')
  end
  # Exercise 4 - Rewrite each() that prints all students using while or until
  # i = 0
  # until !students[i]
      # puts "#{i+1} #{students[i][:name]} (#{students[i][:cohort]} cohort)"
    # end
    # i += 1
  # end
end
# Exercise 2 - Print students whose name begins with specific letter
def print_with_initial(students, initial)
  students = students.select{ |student| student[:name][0] == initial}
  print(students)
end
# Exercise 3 - Print students whose name is shorter than 12 characters
def print_names_shorter_than_12(students)
  students = students.select { |student| student[:name].size < 12 }
  print(students)
end
# Exercise 8 - Print by cohorts
def print_by_cohorts(students, cohort)
  students = students.select { |student| student[:cohort] == cohort}
  print(students)
end

def print_footer(students)
  puts "Overall, we have #{students.count} great #{one_or_more?(students)}"
end
# Call methods
students = input_students

print_header
print(students)

print_header
puts "With initial G"
print_with_initial(students, "G")

print_header
puts "Names less than 12 characters"
print_names_shorter_than_12(students)

print_header
puts "In November cohort"
print_by_cohorts(students, "November")

print_footer(students)
