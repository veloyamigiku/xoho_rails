# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'csv'
require 'json'

csv_info_list = [
    {
        "name" => "movie.csv",
        "model" => Movie
    },
    {
        "name" => "theater.csv",
        "model" => Theater
    },
    {
        "name" => "movie_theater.csv",
        "model" => MovieTheater
    },
    {
        "name" => "area.csv",
        "model" => Area
    }]

csv_info_list.each do |csv_info|
    csv_path = File.dirname(__FILE__) + File::SEPARATOR + csv_info["name"]
    puts(csv_path)
    body = File.open(csv_path).read
    csv = CSV.new(body, headers: true)
    csv.to_a.map do |row|
        exists_model = csv_info["model"].find_by(id: row.to_hash['id'])
        if exists_model.nil? then
            csv_info["model"].create(row.to_hash)
        else
            exists_model.update(row.to_hash)
        end
        
    end
end
