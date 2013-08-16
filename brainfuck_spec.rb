class BrainFuck
  def initialize(char_code)
    @char_code = char_code
    @array_of_ints = [0] * 1000
    @array_of_ints_index = 0
    @brain_fuck_array_index = 0
  end

  def print
    output = ''

    while @brain_fuck_array_index < @char_code.length
      current_sym = @char_code[@brain_fuck_array_index]
      if current_sym == "["
        ob
      elsif current_sym == "]"
        cb
      elsif current_sym == "."
        output << @array_of_ints[@array_of_ints_index].chr
        @brain_fuck_array_index += 1
      elsif current_sym == ","
        comma
      elsif current_sym == " "
        @brain_fuck_array_index += 1
      else
        send(current_sym)
      end
    end

    output
  end

  def comma
    x = STDIN.getc
    @array_of_ints[@array_of_ints_index] = x.ord
    @brain_fuck_array_index += 1
  end

  def method_missing(*args)
    @brain_fuck_array_index += 1
  end

  def >
    @array_of_ints_index += 1
    @brain_fuck_array_index += 1
  end

  def +
    @array_of_ints[@array_of_ints_index] += 1
    @brain_fuck_array_index += 1
  end

  def -
    @array_of_ints[@array_of_ints_index] -= 1
    @brain_fuck_array_index += 1
  end

  def <
    @array_of_ints_index -= 1
    @brain_fuck_array_index += 1
  end

  def ob
    if @array_of_ints[@array_of_ints_index] == 0
      (@brain_fuck_array_index..@char_code.length - 1).each do |i|
        @brain_fuck_array_index = (i + 1); break if @char_code[i] == "]"
      end
    else
      @brain_fuck_array_index += 1
    end
  end

  def cb
    if @array_of_ints[@array_of_ints_index] != 0
      @brain_fuck_array_index.downto(0) do |i|
        @brain_fuck_array_index = (i + 1); break if @char_code[i] == "["
      end
    else
      @brain_fuck_array_index += 1
    end
  end
end
