@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file"
  puts "4. Load the list of students from a file"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
    when "1"
      selection_message(selection)
      input_students
    when "2"
      selection_message(selection)
      show_students
    when "3"
      selection_message(selection)
      puts "Save list to which file?"
      filename = gets.chomp
      save_students(filename)
    when "4"
      selection_message(selection)
      puts "Load list from which file?"
      filename = gets.chomp
      load_students(filename)
    when "9"
      selection_message(selection)
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def selection_message(selection)
  puts "----------"
  puts "Option #{selection} selected"
  puts "----------"
end


def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #get first name
  name = STDIN.gets.chomp
  #while name is not empty, repeat this code
  while !name.empty? do
    #add student hash to array
    add_students(name)
    puts "Now we have #{@students.count} students"
    #get another name from the user
    name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_header
  lineWidth = 50
  puts "The students of Villains Academy".center(lineWidth)
  puts "-------------".center(lineWidth)
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  if @students.count == 1
    puts "Overall, we have 1 great student"
  else
    puts "Overall, we have #{@students.count} great students"
  end
  puts "-------------"
end

def save_students(filename="students.csv")
  file = File.open(filename, "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename="students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    add_students(name, cohort)
  end
  file.close
end

def add_students(name, cohort=:november)
  @students << {name: name, cohort: cohort.to_sym}
end

def try_load_students
  filename = ARGV.first
  filename = "students.csv" if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

try_load_students
interactive_menu
