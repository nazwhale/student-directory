@students = []

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #get first name
  name = gets.chomp
  cohorts = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  #while name is not empty, repeat this code
  while !name.empty? do
    cohort = enter_cohort
    until cohorts.include? cohort
      puts "Value entered is not a month"
      cohort = enter_cohort
    end
    cohort = cohort.to_s
    @students << {name: name, cohort: cohort}
    if @students.count == 1
      puts "Now we have 1 student"
    else
      puts "Now we have #{@students.count} students"
    end
    #get another name from the user
    name = gets.chomp
  end
end

def enter_cohort
  puts "Enter cohort month"
  puts "To use default value, just hit return"
  cohort = gets.chomp
  cohort = cohort.capitalize
  if cohort == ""
    cohort = "November"
    puts "No month entered. Cohort set to default month (November)"
  end
  cohort
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def print_header
  lineWidth = 50
  puts "The students of Villains Academy".center(lineWidth)
  puts "-------------".center(lineWidth)
end

def print_students_list
  count = 0
  until count == @students.length
    puts "#{count+1}. #{@students[count][:name]} (#{@students[count][:cohort]} cohort)"
    count +=1
  end
end

def print_footer
  if @students.count == 1
    puts "Overall, we have 1 great student"
  else
    puts "Overall, we have #{@students.count} great students"
  end
end


interactive_menu
