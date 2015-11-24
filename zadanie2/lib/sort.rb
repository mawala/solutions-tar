#!/usr/bin/ruby -w

def qsort(arr)
  return [] if arr.empty?
  x, *rest = arr
  less, more = rest.partition { |y| y < x }
  qsort(less) + [x] + qsort(more)
end
