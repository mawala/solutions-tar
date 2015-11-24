#! /usr/bin/env ruby

require 'benchmark'
require_relative '../lib/find'
require_relative '../lib/sort'

array = [8, 5, 7, 2, 1, 3, 18]

print 'Weźmy tablicę: '
p array
puts "\n"

print 'Indeks elementu 7 to: '
p find(7, array)
print 'Poszukajmy 9: '
p find(9, array)
puts "\n"

print 'Użyjmy wyszukiwania binarnego elementu 2: '
p find_binary(2, array)
puts "\n"

print 'Posortujmy tablicę: '
array = qsort(array)
p array
print 'Teraz możemy wyszukiwać binarnie'
puts "\n"

print 'Indeks elementu 2: '
p find_binary(2, array)
puts "\n"

puts 'Porównanie czasów sortowania wbudowanego i quick sort'

array = (1..10_000).map { rand }

Benchmark.bmbm do |x|
  x.report(".sort") { array.sort }
  x.report("QuickSort") { qsort(array)  }
end

puts "\n"
puts 'Porównanie czasów wyszukiwania wbudowanego, liniowego i binarnego'

array.sort!
i = rand(1..10_000)

Benchmark.bm(10) do |x|
  x.report(".index") { array.index(array[i]) }
  x.report("Find") { find(array[i], array) }
  x.report("Find binary") { find_binary(array[i], array)  }
end
