class Tictactoe 
    #players 
    $x = 0
    $o = 0
    #board
    $board = ['0','1','2','3','4','5','6','7','8']
    # for i in 0...9
    #     $board[i] = rand(0...10)
    # end

#MENU
    def MENU
        puts "****WELCOME to TIC TAC TOE GAME******\n"
        puts "_____OPTIONS______\n"
        puts "press the number of your answer...\n"
        puts "START........1\n"
        puts "EXIT.........2\n"
        res = gets.chomp
        res.to_i
        case res
            when '1' 
                START()
            when '2'
                EXIT()
            else
                puts "Invalid option, press a valid button\n"
                MENU()
        end
    
    end
    #start
    def START
        puts "************START***************"
        for i in 0...9
           print "__" + $board[i] + "__" + " |" + "\t"
            if $board[i] == '2' || $board[i] == '5' || $board[i] == '8'
                puts "\n"
            end
        end
        puts "Are you Ready? press 1, return menu press 2"
        ans = gets.chomp
        ans.to_i
        case ans
            when '1' 
                GAME()
            when '2'
                MENU()
            else
                puts "Invalid option, press a valid button\n"
                START()
        end
    end

#GAME
    def GAME
        puts "give me the number of volume? only one number por example 3 --- = 3x3"
        n = gets.chomp
        n = n.to_i
        n = n * n  
        board = Array.new(n)
        (0..n-1).each do |i|
            board[i] = rand(n)
        end
        (0..n-1).each do |i|
            print "|_#{board[i]}_|"

            if i==2 || i ==5 || i == 8
                puts "\n"
            end
        end
    # puts "player 1 your turn"
    # puts "player 2 your turn"

    end

    #EXIT GAME
    def EXIT
    exit 
    end
end 