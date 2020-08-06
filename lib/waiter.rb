class Waiter
    attr_accessor :name, :years
    @@all = []

    def initialize(name, years)
        @name = name
        @years = years
        @@all << self
    end

    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end

    def self.all
        @@all
    end

    def meals
        Meal.all.select do |meal|
          meal.waiter == self #checking for waiter now
        end
    end

    def best_tipper
        best_tipped_meal = meals.max { |meal_a, meal_b| meal_a.tip <=> meal_b.tip }       
        best_tipped_meal.customer
    end

end