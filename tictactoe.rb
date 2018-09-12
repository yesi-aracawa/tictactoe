#players 
$x = 0
$o = 0
#board
$board = Array.new(3,[])

#MENU
def MENU
    puts "****WELCOME to TIC TAC TOE GAME******\n"
    puts "_____OPTIONS______\n"
    puts "press the number of your answer...\n"
    puts "START........1\n"
    puts "EXIT.........2\n"
    res = gets.chomp
    res = res.to_i
    case res
        when '1' 
            puts "you pressed 1"
        when '2'
            puts "you pressed 2"
        else
            puts "Invalid option, press a valid button\n"
            MENU
    end

end
#start
# def START
#     puts "************START***************"
#     for i in 0...3
#         for j in 0...3
#             puts $borad[i][j] + "\n"
#             $board[i][j] = gets.to_i
#         end
#     end
#     puts "Are you Ready? press 1, return menu press 2"
#     case res
#         when 1 
#             GAME
#         when 2
#             MENU
#         else
#             puts "Invalid option, press a valid button\n"
#             START
#     end
# end

# #GAME
# def GAME
#     puts "give me the number of volume? only one number por example 3 --- = 3x3"
    

# puts "player 1 your turn"
# puts "player 2 your turn"

# end

# #EXIT GAME
# def EXIT
#   exit 
# end