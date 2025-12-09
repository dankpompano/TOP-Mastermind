class Computer
    def initialize()
      @comp_code = generate_code
    end

    def generate_code
      digits = (1..6).to_a
      unique_digits = digits.sample(4) # Select 4 unique digits randomly
      random_number = unique_digits.join.to_i # Join the array into a string and convert to an integer
      return random_number
    end
end 

