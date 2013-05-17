require 'io/wait'

class Chomper
  # Allows 'Press any key to continue' to work without requiring return.
  def self.get_char
    begin
      # save previous tty state
      state = `stty -g`
      # -icanon - disable canonical input (ERASE and KILL processing)
      # sig - checking characters against control characters INTR, QUIT, and SUSP
      `stty raw -echo -icanon isig`

      begin
        # do / while since using the arrow keys results in multi-byte input
        # that gets left in the stdin buffer.
        STDIN.getc.chr
      end while $stdin.ready?
    ensure
      # restore the default tty state
      `stty #{state}`
    end
  end
end
