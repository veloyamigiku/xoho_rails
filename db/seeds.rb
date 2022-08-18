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
    }]

csv_info_list.each do |csv_info|
    csv_path = File.dirname(__FILE__) + File::SEPARATOR + csv_info["name"]
    body = File.open(csv_path).read
    csv = CSV.new(body, headers: true)
    csv.to_a.map do |row|
        csv_info["model"].create(row.to_hash)
    end
end
