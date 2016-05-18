#! ruby -Ku
require "kconv"

def getInput
	print(Kconv.tosjis("(あなたの手を選んでください)"), "\n")
	print(Kconv.tosjis("1:グー　2:チョキ　3:パー"), "\n", ">")
	STDOUT.flush

	input = gets.to_i

	if validateInput(input) then
		return input
	else
		getInput
	end
end

def validateInput(input)
	if input == 1 || input == 2 || input == 3 then
		return true
	end
	print(Kconv.tosjis("不正な入力値です"), "\n")
	return false
end

def judge(input)
	enemy = rand(2) + 1
	print(Kconv.tosjis("あなた："), toStringHand(input),"\n")
	print(Kconv.tosjis("あいて："), toStringHand(enemy),"\n")

	case (input - enemy + 3) % 3
	when 0 then
		print(Kconv.tosjis("あいこです"),"\n")
		doJanken()
	when 1 then
		print(Kconv.tosjis("あなたの負けです"),"\n")
	else
		print(Kconv.tosjis("あなたの勝ちです"),"\n")
	end
end

def toStringHand(hand)
	case hand
	when 1 then
		return "グー"
	when 2 then
		return "チョキ"
	else
		return "パー"
	end
end

def doJanken()
	input = getInput
	judge(input)
end

print(Kconv.tosjis("最初はグー、じゃんけん、"), "\n")

doJanken
