class TicTacToeGame

    attr_accessor :board, :current_player, :moves

    def initialize
        @current_player = 1
        @moves = 0
        @board = Array.new(3) { Array.new }
    end

    def make_move(x, y)
        return false if @board[x][y] != nil
        @board[x][y] = @current_player
        @moves = @moves.to_i + 1
        true
    end

    def reset_game
        @board = Array.new(3) { Array.new }
        @current_player = 1
        @moves = 0
    end

    def check_winner(x ,y)
        n = 3
        col = row = diag = rdiag = 0
        for i in 0..2
            col=col+1 if @board[x][i] == @current_player
            row=row+1 if @board[i][y] == @current_player
            diag=diag+1 if @board[i][i] == @current_player
            rdiag=rdiag+1 if @board[i][n-i-1] == @current_player
        end
        if row == n || col == n || diag == n || rdiag == n
            return @current_player
        end
        return 3 if moves == 9
        return 0
    end

    def change_player
        if @current_player == 1
            @current_player = 2
        else
            @current_player = 1
        end
        @current_player
    end

end