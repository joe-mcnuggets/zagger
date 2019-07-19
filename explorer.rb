require 'morphy2'
require 'pry'
require 'tabulo'
@data = Morphy.paradigms

def get_el(id)
  el = @data[id]
  scms =[]
  el.each_slice(3) do |slice|
    scms << {
      prefix: Morphy.prefixes[slice[0]],
      suffix: Morphy.suffixes[slice[1]],
      grammeme: Morphy.grammemes[slice[2]]
    }
  end
  return {
    scm: el,
    scms: scms
  }
end

while gets do
  e = get_el($_.to_i)
  table = Tabulo::Table.new(e[:scms]) do |t|
    t.add_column('prefix') { |n| n[:prefix] }
    t.add_column('suffix') { |n| n[:suffix] }
    t.add_column('grammeme', width: 42) { |n| n[:grammeme].join(' ') }
  end
  puts table
end
