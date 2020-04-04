require 'csv'

@students = []

# Exercise 3 - Refactor code
def print_student_header
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
end

def input_students
  print_student_header

  name = STDIN.gets.chomp

  while !name.empty? do
    add_student(name, "november")
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print
  for student in @students
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file"
  puts "4. Load the list from a file"
  puts "9. Exit"
end

def show_students
  print_header
  print
  print_footer
end

def print_selected_option(selection)
  puts "Selected option #{selection}."
end

def process(selection)
  # Exercise 4 - Implement feedback for user if input was successful
  print_selected_option(selection)

  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def save_students
  filename = enter_filename
  # Open the file for writing
  CSV.open(filename, "wb") do |file|
    # Iterate over the array of students
    @students.each do |student|
      file << [student[:name], student[:cohort]]
    end
  end
end

def load_students(filename = enter_filename)
  # Exercise 6 - Use code blocks when opening(& closing) files
  # Exercise 7 = Use ruby's CSV library
  CSV.foreach(filename) do |student|
    name   = student[0]
    cohort = student[1]
    add_student(name, cohort)
  end
end
# Exercise 5 - Make script flexible by asking for filename
def enter_filename
  puts "Enter file name"
  STDIN.gets.chomp
end

def load_default_students
  filename = ARGV.first # First argument from the command line
  filename = "students.csv" unless filename # Exercise 2 - Load students.csv by default if no command line arugment given
  return if filename.nil? # Get out of the method if it isn't given
  if File.exists?(filename) # If it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # If it doesn't exsist
    puts "Sorry, #{filename} doesn't exist."
    exit # Quit the program
  end
end

# Exercise 1 - Extract adding students into a single method
def add_student(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

load_default_students
interactive_menu
