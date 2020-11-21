class Cult
    attr_accessor :name, :location, :slogan, :minimum_age
    attr_reader :year_founded

    @@all = []

    def initialize(name, location, year, slogan, minimum_age)
        @name = name
        @location = location
        @year = year
        @slogan = slogan
        @minimum_age = minimum_age
        @@all << self
    end

    def self.all
        @@all
    end

    def blood_oaths
        BloodOath.all.select {|oath| oath.cult == self}
    end

    def followers
        self.blood_oaths.map {|oath| oath.follower }
    end

    def recruit_follower(follower)
        if follower.age < minimum_age
            puts "Too young. Kindly scram"
        else
        BloodOath.new(self, follower, Time.new.strftime("%Y-%m-%d %H:%M:%S"))
        end
    end

    def cult_population
        followers.count
    end

    def self.find_by_name(name)
        Cult.all.find {|cult|cult.name == name}
    end

    def self.find_by_location(location)
        Cult.all.find {|c|c.location == location}
    end

    def self.find_by_founding_year(year)
        Cult.all.select {|c| c.year_founded == year}
    end

    def average_age
        a = self.followers.map {|f| f.age}
        (a.sum / a.length).to_f
    end

    def my_followers_mottos
        self.followers.each {|f| puts f.motto}
    end

    def self.least_popular
        Cult.all.min {|a, b| a.cult_population <=> b.cult_population }
    end

    def self.most_common_location
        locations = Cult.all.map {|cult| cult.location}
        locations.max_by {|i| locations.count(i)}
    end
    
    def minimum_age
        @minimum_age
    end

end