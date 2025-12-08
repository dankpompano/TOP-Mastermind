class Computer
    def initialize()
      @comp_code = generate_code
    end

    def generate_code
      rand_code = 4.times.map { rand(1..6) }.join
      return rand_code
    end
end 

