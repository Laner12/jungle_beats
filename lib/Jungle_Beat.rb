require_relative "linked_list"

class JungleBeat
  attr_accessor :list, :rate, :voice

  def initialize
    @list = LinkedList.new
    @rate = 500
    @voice = "Boing"
  end

    def append(data)
      data_string = data.split
      data_string.each do |data|
        @list.append(data)
      end
      data_string
    end

    def count
      @list.count
    end

    def play
      `say -r #{@rate} -v #{@voice} #{@list.to_string}`
    end

end
