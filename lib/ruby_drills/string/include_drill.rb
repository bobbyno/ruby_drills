class IncludeDrill < Drill

  def setup
    @message = "hjwotrubjof15joe7;q;j8eldjowj234nfinskpaohello2j\ndilenudbjsinfjubfhbjisnkfnbfurbrofbdj92"
    @hints = ["What's another way to state that something is comprised of another thing?"]
  end

  def show
    puts %{
@message = #{@message.inspect}

Find out if this cryptic string contains the string 'hello'.

Use the method that will return true or false depending on if the string 'hello'
is in @message:
}
  end

  def reference
    "@message.include?('hello')"
  end

  def valid?(input)
    input.include?("include?")
  end

end
