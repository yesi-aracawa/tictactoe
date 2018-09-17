class Tictactoe 
#players 
    $pl = 0
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
                system 'clear'
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
        if sizrb < 3
            puts "ERROR you can't put a number < 3"
            GAME()
        else
            n = sizrb
            sizrb = sizrb * sizrb  
            $board = Array.new(sizrb)
            (0..sizrb-1).each do |i|
                $board[i] = i.to_s
            end
            system 'clear'
            system 'cls'
            Dboard(n)
            Play(sizrb,n,$board)
        end
    end
#PLAY
def Play(sizrb,n,board)
    cont = 0
    $pl = 1
    while ($winner!=1 && $winner !=2) && cont < sizrb
        puts "player #{$pl} your turn, press the number of the position you want"
        p = gets.chomp
        p = Integer(p).to_i
        Position($pl,p)
        Dboard(n)
        if n==3
            $winner = regex(board,$pl)
        else
            $winner = Valid(board,$pl,p,n)
            puts $winner
        end
        $pl=2-(cont%2)
        cont +=1
    end
    if $winner == 1 ||  $winner == 2
        puts "Congratulations Player #{$winner}!! YOU WON"
        Again()
    else
        puts "THE GAME IS OVER"
        Again()
    end
    
end

#Position
    def Position(pl,p)
        if pl == 1
            $board[p] = 'X'
        elsif pl == 2
            $board[p] = 'O'
        else
            puts "error in Players Position"
        end
    end

#Valid GAME
    def regex(board,pl)
        board = board.join
        puts board
       if /^\s*(?:...){0,2}(XXX|OOO)|^\s*(O|X)..\2..\2..|^\s*.(O|X)..\3..\3.|^\s*..(O|X)..\4..\4|^\s*(O|X)...\5...\5|^\s*..(O|X).\6.\6../.match(board.to_s) != nil 
            if pl == 1 || pl == 2
                return pl
            end
        else
             return 0
       end
    end

    def Valid(board,pl,p,n)
        sizrb = n*n
        i = p%n
        c = board[p]
        j = (p/n) * n
        #colums
        row = 0
        while i < sizrb do 
            if board[i] != c
                break
            end
            puts row == n-1
            if row == n-1
                return pl
            end
            i+=n
            row += 1
        end
        #rows
        col = 0
        while col < n do
            if board[j+col] != c
                break
            end
            if col == n-1
                return pl
            end
            col+=1
        end
        #diagonal
        i = 0
        while i < sizrb do
            if board[i] != c
                break
            end
            if i == sizrb-1
                return pl
            end
            i = i + (n+1)
        end
        #slash
        i = n-1
        while i < sizrb-(n-1) do
            if board[i] != c
                break
            end
            if i == sizrb-n
                return pl
            end
            i = i + (n-1)
        end
    end

#Play Again
def Again
    puts "Play again? yes-> press 1, No-> press2\n"
    pa = gets.chomp
    case pa
        when '1'
            system 'clear'
            system 'cls'
            GAME()
        when '2'
            system 'clear'
            system 'cls'
            EXIT()
        else
            puts "Invalid Number try Again"
            system 'clear'
            system 'cls'
            Again()
    end
end
#EXIT GAME
    def EXIT
    exit 
    end
end 