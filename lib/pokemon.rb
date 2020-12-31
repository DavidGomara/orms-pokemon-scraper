class Pokemon

    attr_accessor :name, :type, :db
    attr_reader :id

    def initialize(name, id=nil, type=nil, db=nil)
        @name = name
        @type = type
        @id = id
        @db = db
    end 

    def self.save(name, type, db)
        sql = <<-SQL
        INSERT INTO pokemon (name, type)
        VALUES (?, ?)
        SQL

        db.execute(sql,name,type)
    end 

    def self.find(x, db)
        sql = <<-SQL
        SELECT *
        FROM pokemon
        WHERE id 
        IS ?;
        SQL

        pokemon_array = db.execute(sql,x).flatten
        
        Pokemon.new(pokemon_array[1], pokemon_array[0], pokemon_array[2], db)
    end 
end
