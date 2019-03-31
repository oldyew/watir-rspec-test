array = [1, 4, 5, 6, 3, 7, 23, 6, 57, 8, 90, 34, 15, 23, 3, 6, 7]
# Bubble sort
def bubble_sort(array)
  n = array.length
  loop do
    swapped = false
    (n - 1).times do |i|
      if array[i] > array[i + 1]
        array[i], array[i + 1] = array[i + 1], array[i]
        swapped = true
      end
    end
    break unless swapped
  end
  array
end
p bubble_sort(array)
# Quick sort or array.sort
class Array
  def quicksort
    return [] if empty?

    pivot = delete_at(rand(size))
    left, right = partition(&pivot.method(:>))
    return *left.quicksort, pivot, *right.quicksort
  end
end
# Merge sort
def merge(left, right)
  if left.empty?
    right
  elsif right.empty?
    left
  elsif left.first < right.first
    [left.first] + merge(left[1..left.length], right)
  else
    [right.first] + merge(left, right[1..right.length])
  end
end

def merge_sort(list)
  if list.length <= 1
    list
  else
    mid = (list.length/2).floor
    left = merge_sort(list[0..mid - 1])
    right = merge_sort(list[mid..list.length])
    merge(left, right)
  end
end
p merge_sort(array)

# sum of the number digits
p (2 ** 1000).to_s.split(//).map(&:to_i).inject(:+)

# count the letters
require 'humanize'

(1..1000).to_a.map(&:humanize).join.tr(" -", "").size