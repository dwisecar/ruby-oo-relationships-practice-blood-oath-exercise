class Follower
    attr_accessor :name, :age, :motto

    @@all = []

    def initialize(name, age, motto)
        @name = name
        @age = age
        @motto = motto
        @@all << self
    end

    def self.all
        @@all
    end

    def life_motto
        self.motto
    end

    def blood_oaths
        BloodOath.all.select {|oath| oath.follower == self}
    end

    def cults
        self.blood_oaths.map {|oath| oath.cult }
    end

    def join_cult(cult)
        if cult.minimum_age > self.age
            puts "Nah get outta here"
        else
            BloodOath.new(cult, self, Time.new.strftime("%Y-%m-%d %H:%M:%S"))
        end
    end

    def my_cults_slogans
        self.cults.each {|cult| puts cult.slogan }
    end

    def self.of_a_certain_age(age)
        Follower.all.select {|f| f.age == age}
    end

    def self.most_active
        Follower.all.max {|a, b| a.cults.count <=> b.cults.count}
    end

    def self.top_ten
        Follower.all.sort {|a, z| z.cults.count <=> a.cults.count}.take(10)
    end

    def fellow_cult_members
        self.cults.map {|cult| cult.followers }.flatten.uniq.reject {|i| i == self}
    end



end     