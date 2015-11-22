# in lib/find.rb

def find(x, arr)
  arr.each_index { |i| return i if x == arr[i] }
  'not found'
end

def compare(a, b)
  return -1 if a < b
  return 0 if a == b
  return 1
end

def find_binary(x, arr)
  return 'not sorted' if arr != arr.sort
  return 'not found' if arr.empty?
  l = 0
  r = arr.size
  while l <= r
    m = (l + r) / 2
    case compare(arr[m], x)
	when -1
      l = m + 1
    when 1
      r = m - 1
	when 0
	  return m
    end
  end
  'not found'
end