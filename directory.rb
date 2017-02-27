#In the input_students method the cohort value is hard-coded. How can you ask for both the name and the cohort? What if one of the values is empty? Can you supply a default value? The input will be given to you as a string? How will you convert it to a symbol? What if the user makes a typo?
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  #get first name
  name = gets.chomp
  months = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]
  #while name is not empty, repeat this code
  while !name.empty? do
    #add student hash to array
    puts "Enter cohort month"
    puts "To use default value, just hit return"
    cohort = gets.chomp
    #set default value
    if cohort == ""
      cohort = "november"
      puts "No month entered. Cohort set to default month (november)"
    end
    #check for typos
    until months.include? cohort.downcase
      puts "Value entered is not a month"
      puts "Enter cohort month"
      cohort = gets.chomp
    end
    #convert cohort input to symbol
    cohort = cohort.to_s
    puts "Enter nationality"
    nat = gets.chomp.capitalize
    puts "Enter height (cm)"
    height = gets.chomp
    students << {name: name, cohort: cohort, nationality: nat, height: height}
    puts "Now we have #{students.count} students"
    #get another name from the user
    name = gets.chomp
  end
  #return array of students
  students
end

def print_header
  lineWidth = 50
  puts "The students of Villains Academy".center(lineWidth)
  puts "-------------".center(lineWidth)
end

def print(students)
  count = 0
  until count == students.length
    puts "#{count+1}. #{students[count][:name]} (#{students[count][:cohort]} cohort, nationality: #{students[count][:nationality]}, height: #{students[count][:height]}cm)"
    count +=1
  end
end

def print_footer(students)
  lineWidth = 50
  puts "-------------".center(lineWidth)
  puts "Overall, we have #{students.count} great students".center(lineWidth)
end

def first_letter(students)
  puts "Select first letter to sort students by:"
  letter = gets.chomp
  puts "Students whos name begins with '#{letter}':"
  count = 1
  students.each do |s|
    if s[:name][0] == letter
      puts "#{count}. #{s[:name]} (#{s[:cohort]} cohort)"
      count +=1
    end
  end
end

def shortys(students)
  puts "Students with short names:"
  count = 1
  students.each do |s|
    if s[:name].gsub(" ","").length < 12
      puts "#{count}. #{s[:name]} (#{s[:cohort]} cohort)"
      count +=1
    end
  end
end


students = input_students
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)
