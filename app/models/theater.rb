class Theater < ApplicationRecord
    has_many :movie_theaters
    has_many :movies, through: :movie_theaters
    belongs_to :prefecture
end
