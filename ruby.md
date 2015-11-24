## Ruby, v2.2.3

Podstawy Ruby

```ruby
print 'Hello world'
puts 'Hello world, again'

3.class # => Fixnum
'ab'.class # => String
23.to_s # => "23"

# obiekt.metoda argument1, argument2
24.+ 4
2**5 # => 32

true.class # => TrueClass

pomoc = 'zawsze'
"Niebo #{pomoc} jest niebieskie" # => "Niebe zawsze jest niebieskie"
'Niebo #{pomoc} jest niebieskie' # => "Niebo \#{pomoc} jest niebieskie"

'Hello ' + 'world'
'2 times ' + 3.to_s # => 2 times 3
```

### Array

Tworzenie tablicy
```ruby
ar = [1, 'two', 3.0]
a = [] # to samo, co a = Array.new

a = Array.new(2, [0, 1]) # => [[0, 1], [0, 1]]
a[0][1] = 2
p a # => [[0, 2], [0, 2]]

aa = Array.new(2) { [0, 1] } # => [[0, 1], [0, 1]]
aa[0][1] = 2
p aa # => [[0, 2], [0, 1]

Array.new(4) { |index| 2 * index - 10 } # => [-10, -8, -6, -4]
Array(-2..4) # => [-2, -1, 0, 1, 2, 3, 4]

%w[one two three] # => ["one", "two", "three"]
```
Dostęp do elementów
```ruby
ar = [1, 2, 3, 4, 5]

ar[0] # => 1
ar.at(0)
ar.first

ar[-1] # => 5
ar.last

ar[1, 3] # => [2,3,4]
# skladnia: ar[index, range]
ar[2..4] # => [3,4,5]
ar[1..-2] # => [2,3,4]

ar.take(3) # => [1,2,3]
ar.drop(2) # => [3,4,5]
```
Informacje o tablicy
```ruby
browsers = ['Chrome', 'Firefox', 'Safari', 'Opera', 'IE']

browsers.length # => 5
browsers.count # => 5

browsers.empty? # => false
browsers.include?('Konqueror') # => false
browsers.include?('IE') # => true
```
Dodawanie elementów
```ruby
ar = [1, 2, 3]

ar.push(4) # => [1, 2, 3, 4]
ar << 5 # => [1, 2, 3, 4, 5]
[1, 2, 3] << 'a' << 4 << 'b' # => [1, 2, 3, "a", 4, "b"]

# dodawanie na poczatku tablicy
ar.unshift(0) # => [0, 1, 2, 3, 4, 5]

# dodawanie na podanym miejscu
ar.insert(2, 1.5) # => [0, 1, 1.5, 2, 3, 4, 5]
ar.insert(4, 2.25, 2.5, 2.75) # => [0, 1, 1.5, 2, 2.25, 2.5, 2.75, 3, 4, 5]
```
Usuwanie elementów
```ruby
ar = [1, 2, 3, 4, 5, 2]

# usuniecie elementu z podanego miejsca
ar.delete_at(2)
ar # => [1, 2, 4, 5, 2]

# usuniecie wszystkich elementow o podanej wartosci
ar.delete(2)
ar # => [1, 4, 5]

# pominiecie duplikatow
ar = [1, 2, 3, 4, 5, 5, 5, 2]
ar.uniq # => [1, 2, 3, 4, 5]
ar # => [1, 2, 3, 4, 5, 5, 5, 2]
# z usuwaniem
ar.uniq! # => [1, 2, 3, 4, 5]
ar # => [1, 2, 3, 4, 5]
```
Iteracyjnie
```ruby
ar = [1, 2, 3]

ar.each { |a| print 2 * a, ' ' } # 2 4 6  => [1, 2, 3]
ar.each_index { |a| print a**2, ', ' } # 0, 1, 4,  => [1, 2, 3]

ar2 = []
ar.reverse_each { |a| ar2 << a }
ar2 # => [3, 2, 1]

ar.map { |a| 3 * a } # => [3, 6, 9]
```
Wybór elementów
```ruby
ar = [1, 2, 3, 4, 5]

# bez zmieniania tablicy
ar.select { |a| a > 2 } # => [3, 4, 5]
ar.reject(&:even?) # => [1, 3, 5]
ar.drop_while { |a| a <= 3 } # => [4, 5]

# ze zmienianiem tablicy
ar.select! { |a| a > 2 }
ar.reject! { |a| a > 4 }
ar # => [3, 4]

ar = [1, 2, 3, 4, 5, 6]
ar.delete_if { |a| a < 4 }
ar # => [4, 5, 6]

ar = [1, 2, 3, 4, 5, 6]
ar.keep_if { |a| a < 4 }
ar # => [1, 2, 3]
```
Inne
```rb
a = [0, 1, 2, 1, 3, 4, 5, 1, 3]
a.index(1) # => 1 (pierwszy index wystepowania elementu)
a.rindex(1) # => 7 (ostatni index wystepowania elementu)

a = [0, 1, 2, 3, 4, 5]
a.rotate(3) # => [3, 4, 5, 0, 1, 2]
a.rotate(-2) # => [4, 5, 0, 1, 2, 3]

a.sample(2) # 2 losowe elementy z tablicy

a.shuffle # => [3, 1, 5, 4, 0, 2]

a = %w(a b c)
b = %w(b c d)
a & b # => ["b", "c"] (czesc wspolna)
a | b # => ["a", "b", "c", "d"] (suma)
a + b # => ["a", "b", "c", "b", "c", "d"] (dodawanie)
```

### Hash
Tworzenie hash
```ruby
Hash['a', 1, 'b', 2, 'c', 3] # {"a"=>1, "b"=>2, "c"=>3}
Hash[[['a', 1], ['b', 2], ['c', 3]]] #  {"a"=>1, "b"=>2, "c"=>3}
Hash['a' => 1, 'b' => 2, 'c' => 3] # {"a"=>1, "b"=>2, "c"=>3}
```
Wartość domyślna
```ruby
h = {} # to samo, co h = Hash.new
h.default = 'go'

h = Hash.new('go')

h['a'] = 'ha'

h['c'] # => "go"
h['c'].upcase! # => "GO"
# zmieniona wartosc domyslna
h['d'] # => "GO"

h.keys # => ["a"]

# wartosc domyslna moze zalezec od klucza
h = Hash.new { |hash, key| hash[key] = "+#{key}" }

h['a'] = 'ha'
h.keys # => ["a"]

h['b'] # => "+b"
h.keys # => ["a", "b"]
```
Każdy element
```ruby
h = { 'Jack' => 'Black', 'Simon' => 'White', 'John' => 'Smith' }
h.each { |key, value| puts "#{key} #{value}" }
# Jack Black
# Simon White
# John Smith

h.each_key { |k| puts k }
# Jack
# Simon
# John

h.each_value { |v| puts v }
# Black
# White
# Smith
```
Łączenie
```ruby
h = { 'Jack' => 'Black', 'Simon' => 'White', 'John' => 'Smith' }
h1 = { 'Jack' => 'Small', 'Sarah' => 'Black' }
h.merge(h1) # {"Jack"=>"Small", "Simon"=>"White", "John"=>"Smith", "Sarah"=>"Black"}

h.merge!(h1)
h # {"Jack"=>"Small", "Simon"=>"White", "John"=>"Smith", "Sarah"=>"Black"}
```
### Enumerable

Łączenie elementów
```ruby
[1, 2, 3, 4, 6, 6, 8, 9, 1].chunk { |a| a >= 6 }.each { |bool, ary| p "#{bool}-> #{ary}" }
# "false-> [1, 2, 3, 4]"
# "true-> [6, 6, 8, 9]"
# "false-> [1]"

(1..4).cycle(2) { |a| print a.to_s + ', ' }
# 1, 2, 3, 4, 1, 2, 3, 4,
```
Różne podziały
```ruby
[1, 2, 1, 3, 1, 5].each_cons(2) { |a| p a }
# [1, 2]
# [2, 1]
# [1, 3]
# [3, 1]
# [1, 5]

[1, 2, 1, 3, 1, 5].each_slice(2) { |a| p a }
# [1, 2]
# [1, 3]
# [1, 5]

(0..10).group_by { |a| a % 4 } # {0=>[0, 4, 8], 1=>[1, 5, 9], 2=>[2, 6, 10], 3=>[3, 7]}

(0..10).partition { |a| a % 4 == 0 } # [[0, 4, 8], [1, 2, 3, 5, 6, 7, 9, 10]]

(5..9).slice_after(6).to_a # [[5, 6], [7, 8, 9]]

(1..20).slice_when { |a, b| (a + b) % 3 == 0 }.to_a
# [[1], [2, 3, 4], [5, 6, 7], [8, 9, 10], [11, 12, 13], [14, 15, 16], [17, 18, 19], [20]]
```
