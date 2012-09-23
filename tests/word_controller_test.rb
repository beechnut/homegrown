# Word and WordController test

load '../models/word.rb'
load '../controllers/word_controller.rb'

@word = Word.new("[IAMNOTABRANCH[IAM[ABRANCH]ARENTI]HELLO]")

@word_controller = WordController.new(@word)

puts @word.word

puts "what position do you want to search for a branch?"
@input = gets.chomp!.to_i

puts @word.word
@pos = ""

@input.to_i.times do
	@pos << " "
end
@pos << "^"

puts @pos

puts "before"
@array = @word_controller.get_branch_at(@input.to_i)
puts "after"

puts ""
puts "Your word is: "
puts @word.word[@array[0]..@array[1]]