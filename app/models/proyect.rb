class Proyect < ApplicationRecord
    enum state:[:propuesta, :en_progreso, :terminado]
    validates :name, :description, :state, :initial_date, :finish_date, presence: true
end
