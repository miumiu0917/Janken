#! ruby -Ku
require "kconv"

module Hand
  ROCK = 1
  SCISSORS = 2
  PAPER = 3

  HAND_NAME = {
  	Hand::ROCK => 'グー',
  	Hand::SCISSORS => 'チョキ',
  	Hand::PAPER => 'パー'
  }
end

module Result
	EVEN = 0
	LOSE = 1
	WIN = 2

	def self.result(input, enemy)
		(input - enemy + 3) % 3
	end

	def self.display(result)
		if result == Result::EVEN
			print(Kconv.tosjis("あいこです"),"\n")
			doJanken
		end
		if result == Result::LOSE
			print(Kconv.tosjis("あなたの負けです"),"\n")
		end
		if result == Result::WIN
			print(Kconv.tosjis("あなたの勝ちです"),"\n")
		end
	end
end

module Enemy
	def self.enemy_hand
		rand(2) + 1
	end
end

def getInput
	print(Kconv.tosjis("(あなたの手を選んでください)"), "\n")
	print(Kconv.tosjis("1:グー　2:チョキ　3:パー"), "\n", ">")
	STDOUT.flush

	input = gets.to_i

	if validateInput(input) then
		return input
	end
	getInput
end

def validateInput(input)
	if input == Hand::ROCK || input == Hand::SCISSORS || input == Hand::PAPER then
		return true
	end
	print(Kconv.tosjis("不正な入力値です"), "\n")
	return false
end

def judge(input)
	enemy = Enemy.enemy_hand
	print(Kconv.tosjis("あなた："), Hand::HAND_NAME[input],"\n")
	print(Kconv.tosjis("あいて："), Hand::HAND_NAME[enemy],"\n")

	result =  Result.result input, enemy
	Result.display result
end

def doJanken()
	input = getInput
	judge input
end

print(Kconv.tosjis("最初はグー、じゃんけん、"), "\n")

doJanken
