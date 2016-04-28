require 'rexml/document'
require_relative 'product.rb'
require_relative 'movie.rb'
require_relative 'music_album.rb'
require_relative 'book.rb'

current_path = File.dirname(__FILE__)
xml_file_path = current_path + '/storage.xml'

begin
  xml_storage_tree = Product.read_xml(xml_file_path)
rescue REXML::ParseException => e
  puts "Похоже, ваш xml битый :("
  abort e.message
end

classes_array = [Movie, Book, MusicAlbum]

puts "Какой товар вы хотите добавить на склад?"
classes_array.each_with_index do |mclass, index|
  puts "#{index}. #{mclass}"
end

choice = STDIN.gets.chomp.to_i

puts "Введите цену"
price = STDIN.gets.chomp.to_i

puts "Введите остаток на складе"
stock = STDIN.gets.chomp.to_i

new_product_object = classes_array[choice].new(price,stock)


fields=[]

new_product_object.instance_variables.each do |item|
  fields << item.to_s.delete("@").to_sym unless item.to_s == "@price" || item.to_s == "@storage"
end


params = Hash.new
params_for_xml_tag = Hash.new

for i in fields
  puts "Введите описание для #{i}"
  params[i] = STDIN.gets.chomp
  params_for_xml_tag[i.to_s] = params[i]
end

new_product_object.update params

puts "Запись: " + new_product_object.show

products_tag = xml_storage_tree.elements.find("products").first
product_tag = products_tag.add_element 'product',{'price'=>new_product_object.price, 'stock' =>new_product_object.storage}
product_tag.add_element new_product_object.class.to_s.downcase, params_for_xml_tag

f = File.new(xml_file_path, "w:UTF-8")
xml_storage_tree.write(f, 2)
f.close

puts "Добавлена в xml файл склада магазина!"

