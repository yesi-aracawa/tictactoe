class Tictactoe 
#players 
    $x = 0
    $o = 0
    $winner = 0
#board
    $board = ['0','1','2','3','4','5','6','7','8']

#MENU
    def MENU
        puts "****WELCOME to TIC TAC TOE GAME******\n"
        puts "_____OPTIONS______\n"
        puts "press the number of your answer...\n"
        puts "START........1\n"
        puts "EXIT.........2\n"
        res = gets.chomp
        case res
            when '1' 
                system 'cls'
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

#DISPLAY-BOARD
def Dboard(n)
    cont = 0
    (0..n-1).each do 
        (0..n-1).each do 
            print "|_%02s_|" % $board[cont]
            cont += 1
        end
        print "\n"
    end
end

#GAME
    def GAME
        puts "give me the number of volume? only one number for example 3 --- = 3x3"
        sizrb = gets.chomp
        sizrb = sizrb.to_i
        n = sizrb
        if n < 3
            puts "ERROR you can't put a number < 3"
            GAME()
        else
            sizrb = sizrb * sizrb  
            $board = Array.new(sizrb)
            (0..sizrb-1).each do |i|
                $board[i] = i.to_s
            end
            system 'cls'
            Dboard(n)
            Play(sizrb,n)
        end
    end
#PLAY
def Play(sizrb,n)
    puts "player 1 your turn, press the numer of the position you want"
    p = gets.chomp
    $x=1 
    Position($x,Integer(p))
    Dboard(n)
    $winner = Valid()
    if $winner == 1
        puts "Congratulations Player 1!! YOU WON"
        EXIT()
    elsif $winner == 2
        puts "Congratulations Player 2!! YOU WON"
        EXIT()
    else
        puts "player 2 your turn, press the numer of the position you want"
        p = gets.chomp 
        $y=2
        Position($y,Integer(p))
        Dboard(n)
        $winner = Valid()
        if $winner == 1
            puts "Congratulations Player 1!! YOU WON"
            EXIT()
        elsif $winner == 2
            puts "Congratulations Player 2!! YOU WON"
            EXIT()
        else
            $bandera = 0
            (0..sizrb-1).each do |i|
              if $board[i] != i.to_s
                $bandera = $bandera + 1
              end
            end
            if ($winner == 0 && $bandera == (sizrb-1))
                puts "THE GAME IS OVER"
                EXIT()
            else
            Play(sizrb,n)
            end
        end
    end
    
end

#Position
    def Position(pl,p)
        p = p.to_i
        if pl == 1
            $board[p] = 'X'
        elsif pl == 2
            $board[p] = 'O'
        else
            puts "error in Players Position"
        end
    end

#Valid GAME
    def Valid
        if ($board[0] == $board [1]  && $board[1] == $board[2] )
         	if  $board [0] == 'X'			
                return 1
                else
                return 2 
            end	
        elsif ($board[3] == $board [4]  && $board[4] == $board[5] )
                if $board [3] == 'X'		
                return 1
                else
                return 2 
                end
        elsif ($board[6] == $board [7]  && $board[7] == $board[8] )
                if $board [6] == 'X'			
                return 1
                else
                return 2 
                end
        elsif ($board[0] == $board [3]  && $board[3] == $board[6] )
                if $board [0] == 'X'			
                return 1
                else
                return 2 
                end
        elsif ($board[1] == $board [4]  && $board[4] == $board[7] )
            	if $board [1] == 'X'			
                return 1
                else
                return 2 
                end
        elsif ($board[2] == $board [5]  && $board[5] == $board[8] )
            	if $board [2] == 'X'			
                return 1
                else
                return 2 
                end
        elsif ($board[0] == $board [4]  && $board[4] == $board[8] )
            	if $board [0] == 'X'		
                return 1
                else
                return 2 
                end
        elsif ($board[2] == $board [4]  && $board[4] == $board[6] )
            	if $board [2] == 'X' 		
                return 1
                else
                return 2 
                end
        elsif ($board[0] == $board [3]  && $board[3] == $board[6] )
            	if $board [0] == 'X'			
                return 1
                else
                return 2 
                end
        else 
            return 0
        end
    end

#EXIT GAME
    def EXIT
    exit 
    end
end 