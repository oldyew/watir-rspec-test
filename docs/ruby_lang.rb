puts
print # without \n
.inspect # transform object to string
p method == puts method.inspect
#{...} - interpolation
#  \t - TAB, \n - ENTER, \\, \", \'
'...' without changes
String.chomp - remove \n
String.chop - remove \n and trailing character
return - возвращает значение экземпляра и выходит

if/unless - true/false
while/until - true/false

(1...10).to_a.select do |x|
  x.even?
end

or
(1...10).to_a.select {|x| x.even?}
or
(1...10).to_a.select (&:even?)

def method_name(arg, &block)
  arg.map.with_index(1) do |a,index|
    yield(index,a)
end
var = [value1, value2]
method_name(var) { |x, y| "#{x}. #{y}"}

[1,2,3,4,5,6,7].inject(&:+)

irb -I . - find files for load in current catalog

class - object template. что объект знает о себе (состояние - переменные экземпляра) и что объект делает (поведение - методы экземпляра)
method?, method!, method=
символическое имя
raise "..." - сообщение и прекращение программы

object.instance_variables - список переменных экземпляра
методы суперкласса наследуются, а переменные нет
они создаются при использовании методов

метод сабкласса можно переопределить
super - позволяет использовать метод суперкласса+добавлять к нему что-то
puts = to_s

format("... %.2f", value)
%s - string
%i - fixnum
%f - float

.initialize - инициализация переменных нового экземпляра класса

self

метод класса - используется до создания экземпляра
def ClassName.method_name  or def self.method_name

method arguments
 - traditional - def method arg1, arg2
 - named - def method arh1: , arg2
 - default - def method arg1: arg1 = "arg"
 - traditional splat - def method *args
 - keyword-based splat - def method **args
 - optional - def method options = {}

string.upcase
string.downcase
string.swapcase
string.reverse
string.concat
string.sub 'test', 'test1'
string.gsub
string.strip
string.split
string.split(//) by characters
string.join
str.split.reverse.join(' ')
string.lstrip
string.rstrip
string.strip
string.chop
string.chomp
string.insert
string.count
string.index('word')
string.casecmp
String.each_char

array.at(1)
array.first
array.last
array.take(n)
array.drop(n)
array.sort
array.delete(value)
array.delete_at(position) # delete and return it
array.delete_if { |i| i > 1 }
array.include?(value)
array.length
array.find_index(value)
array.push(value) == array << value #add to the end of array
array.insert(3,'val')
array.pop # remove last element and return it
array.shift - take, return and remove first element
массив в строки
array.join array.join(value)
arr = %w(The quick brown fox jumped over the lazy dog)
=> ["The", "quick", "brown", "fox", "jumped", "over", "the", "lazy", "dog"]
строки в массив
array.chars
array.split(value)
Array.uniq - remove duplicate values

hash[:key]
hash.delete(:key) #delete and return it
hash.each_key { |key| puts key}
hash.each_value { |value| puts value}
hash[:key] = value
new_hash = hash.invert
hash.merge(new_hash)
Array(hash) or hash.to_a
hash.keys
hash.values
hash.length|size
hash.key?(k)
hash.value?(v)


def method_name (&block_name)
  block_name.call (value1, value2)
end

def method_name (&block_name)
  yield value1, value2
end

block_name do |arg1, arg2|
  code
end

block_name { |arg1, arg2| code }

do
end is equal to {}

File.open('PATH', 'w+')
r, a, w, w+, a+, r+

file = File.open('PATH', 'r')
while !file.eof?
  puts file.readline
end

file.puts 'text'

file = File.open('file.txt')
lines = file.readlines - возвращает строки файла в виде массива
file.close

is equal to

lines = []
File.open("file.txt") do |file|
  lines = file.readlines
end
puts lines.length
если файл открывается в блоке то по завершении блока файл будет закрыт автоматически

relevant_lines = []
lines.each do |line|
  if line.include?("Truncated")
    relevant_lines << line
   end
 end
 puts relevant_lines

is equal to

relevant_lines = lines.find_all { |line| line.include?("Truncated") }
puts relevant_lines
reviews = relevant_lines.reject { |line| line.include?("--") }
p reviews

def find_adjectives(string)
  words = string.split(" ")
  index = words.find_index("is")
  words[index + 1]
end

# this code
adjectives = []

reviews.each do |review|
  adjectives << find_adjective(review)
end

# is equal to
adjectives = reviews.map { |review| find_adjective(review)}

puts adjectives

adjectives = reviews.map |review|
  adjective = find_adjective(review)
  " '#{adjective.capitalize}' "
end


def find_adjective(string)
  words = string.split(" ")
  index = words.find_index("is")
  words[index + 1]
end

lines = []
File.open("reviews.txt") do |review_file|
  lines = review_file.readlines
end

relevant_lines = lines.find_all { |line| line.include?("Truncated") }
reviews = relevant_lines.reject { |line| line.include?("--") }

adjectives = reviews.map do |review|
  adjective = find_adjective(review)
  " '#{adjective.capitalize}' "
end

puts "The critics agree, Truncated is:"
puts adjectives


[1, 2, 3, 4].find_all { |number| number.odd? } - все нечетные
[1, 2, 3, 4].find_all { |number| true } - все
[1, 2, 3, 4].find_all { |number| false } - ни одного
[1, 2, 3, 4].find { |number| number.even? } - первый тру
[1, 2, 3, 4].reject { |number| number.odd? } - все четные
[1, 2, 3, 4].all? { |number| number.odd? } - все нечетные?
[1, 2, 3, 4].any? { |number| number.odd? } - какой-нить нечетный?
[1, 2, 3, 4].none? { |number| number > 4 } - ни один не больше 4
[1, 2, 3, 4].count { |number| number.odd? }
[1, 2, 3, 4].partition { |number| number.odd? } - массив из 2х массивов - нечетные и четные
['$', '$$', '$$$'].map { |string| string.length }
['$', '$$', '$$$'].max_by { |string| string.length } - наибольший
['$', '$$', '$$$'].min_by { |string| string.length } - наименьший

# Enumerable
.map syn .collect
.find syn .detect
.select syn .find_all
.select opp .reject
.inject syn .reduce
.each
.include? syn .member?



lines = []
File.open("votes.txt") do |file|
  lines = file.readlines
end

votes = Hash.new(0)

lines.each do |line|
  name = line.chomp
  name.upcase!
  votes[name] += 1
end

votes.each do |name, count|
  puts "#{name}: #{count}"
end

class MyClass
  # attr_accessor :name
  # attr_writer :name
  def my_attribute=(new_value)
    @my_attribute = new_value
  end
  # attr_reader :name
  def my_attribute
    @my_attribute
  end
end

# If you need the ability to call the data elements outside of the class,
# then you would still need to have the attr_accessor call in place.

class Candidate
  attr_accessor :name, :age, :occupation, :hobby, :birthplace
  def initialize(name, age:, occupation:, hobby: nil, birthplace: "Sleepy Creek")
    self.name = name
    self.age = age
    self.occupation = occupation
    self.hobby = hobby
    self.birthplace = birthplace
  end
end

p Candidate.new("Carl Barnes", age: 49, occupation: "Attorney")

class CelestialBody
  attr_accessor :type, :name
end

bodies = Hash.new do |hash, key|
  body = CelestialBody.new
  body.type = "planet"
  hash[key] = body
end

bodies['Mars'].name = 'Mars'
bodies['Europa'].name = 'Europa'
bodies['Europa'].type = 'moon'
bodies['Venus'].name = 'Venus'

p bodies

@comments ||= [] or @comments = @comments || []


module AcceptsComments
  def comments
    @comments ||= []
  end
  def add_comment(comment)
    comments << comment
  end
end

class Clip
  def play
    puts "Playing #{object_id}..."
  end
end

class Video < Clip
  include AcceptsComments
  attr_accessor :resolution
end

class Song < Clip
  include AcceptsComments
  attr_accessor :beats_per_minute
end

class Photo
  include AcceptsComments
  def initialize
    @format = 'JPEG'
  end
end

video = Video.new
video.add_comment("Cool slow motion effect!")
video.add_comment("Weird ending.")
song = Song.new
song.add_comment("Awesome beat.")
photo = Photo.new
photo.add_comment("Beautiful colors.")
p video.comments, song.comments, photo.comments

<=>

class Steak
  include Comparable
  GRADE_SCORES = {"Prime" => 3, "Choice" => 2, "Select" => 1}
  attr_accessor :grade
  def <=>(other)
    if GRADE_SCORES[self.grade] < GRADE_SCORES[other.grade]
      return -1
    elsif GRADE_SCORES[self.grade] == GRADE_SCORES[other.grade]
      return 0
    else
      return 1
    end
  end
end

prime = Steak.new
prime.grade = "Prime"
choice = Steak.new
choice.grade = "Choice"
select = Steak.new
select.grade = "Select"

puts "prime > choice: #{prime > choice}"
puts "prime < select: #{prime < select}"
puts "select == select: #{select == select}"
puts "select <= select: #{select <= select}"
puts "select >= choice: #{select >= choice}"
print "choice.between?(select, prime): "
puts choice.between?(select, prime)


class Apple
  include Comparable
  attr_accessor :weight

  def initialize(weight)
    self.weight = weight
  end

  def <=>(other)
    self.weight <=> other.weight
  end
end

small_apple = Apple.new(0.17)
medium_apple = Apple.new(0.22)
big_apple = Apple.new(0.25)
puts "small_apple > medium_apple:"
puts small_apple > medium_apple
puts "medium_apple < big_apple:"
puts medium_apple < big_apple

module Comparable
module Enumerable

class WordSplitter
  include Enumerable
  attr_accessor :string
  def each
    string.split(" ").each do |word|
      yield word
    end
  end
end

splitter = WordSplitter.new
splitter.string = "how do you do"

p splitter.find_all { |word| word.include?("d") }
p splitter.reject { |word| word.include?("d") }
p splitter.map { |word| word.reverse }


class OvenOffError < StandardError
end
class OvenEmptyError < StandardError
end

class SmallOven
  attr_accessor :contents
  def turn_on
    puts "Turning oven on."
    @state = "on"
  end
  def turn_off
    puts "Turning oven off."
    @state = "off"
  end
  def bake
    unless @state == "on"
      raise OvenOffError, "You need to turn the oven on first!"
    end
    if @contents == nil
      raise OvenEmptyError, "There's nothing in the oven!"
    end
    "golden-brown #{contents}"
  end
end

dinner = ['turkey', 'casserole', 'pie']
oven = SmallOven.new
oven.turn_off
dinner.each do |item|
  begin
    oven.contents = item
    puts "Serving #{oven.bake}."
  rescue OvenEmptyError => error
    puts "Error: #{error.message}"
  rescue OvenOffError => error
    oven.turn_on
    retry
  ensure
    oven.turn_off
  end
end

begin
  puts nil + 10
rescue StandardError => error
  error_logger("Error: #{error} at #{Time.now}")
end

def error_logger(error)
  File.open('PATH', 'a') do |file|
    file.puts error
  end
end


ARGV[0] - command line

require vs load == one time vs each time
include vs extend == instance method vs class method

full_name = Proc.new{ |first, last| first + " " + last}

full_name = lamda { |first, last| first + " " + last}
p full_name["jordan", "hudgens"]
or
full_name = -> (first, last) {first + " " + last}
p full_name.call("jordan", "hudgens")

p string =~ /value/
p string =~ /value/ ? 'Valid' : 'Invalid'
or
if string =~ /value/
  p 'Valid'
else
  p 'Invalid'
end
p string =~ /Z/i ? 'Valid' : 'Invalid' # case insensative
p string.to_enum(:scan, /\d+/).map {Regexp.last_match}
VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i


# MS Excel
require 'spreadsheet'

workbook = SpreadSheet::Wrokbook.new
sheet = workbook.create_sheet
sheet.name = 'Sheet 1'
sheet[0,1] = 'Text'
workbook.write('PATH')

# YAML
require 'yaml'

config = YAML.load_file('PATH')
config[0][key]
