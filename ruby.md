## Ruby, v2.2.3

Podstawy Ruby

```ruby
print 'Hello world'
puts 'Hello world, again'

3.class # Fixnum
"ab".class # String
23.to_s # "23"

#obiekt.metoda argument1, argument2
24.+ 4
2**5 # 32

true.class # TrueClass

pomoc = 'zawsze'
"Niebo #{pomoc} jest niebieskie" # "Niebe zawsze jest niebieskie"

'Hello ' + 'world'
'2 times ' + 3.to_s # 2 times 3
```

### Arrays

Tworzenie tablicy
```ruby
ary = [1, "two", 3.0]
Array.new # []
Array.new(3, "a") # ["a","a","a"]
Array.new(2) { Array.new(3, 1) } # [[1,1,1], [1,1,1]]
```
Dostęp do elementów
```ruby
ary = [1,2,3,4,5]

ary[0] # 1
ary.at(0)
ary.first

ary[-1] # 5
ary.last

ary[1,2] # [2,3]
ary[2..4] # [3,4,5]
ary[1..-2] # [2,3,4]

ary.take(3) # [1,2,3]
ary.drop(2) # [3,4,5]
```
Informacje o tablicy
 ```ruby
browsers = ['Chrome', 'Firefox','Safari','Opera','IE']

browsers.length # 5
browsers.count # 5

browsers.empty? # false
browsers.include?('Konqueror') # false
browsers.include?('IE') # true
```

