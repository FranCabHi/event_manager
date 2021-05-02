class Group < ApplicationRecord
    has_many :concerts, dependent: :destroy
    has_many :crews, dependent: :destroy
    accepts_nested_attributes_for :crews
    enum group_type: [:GirlBand, :BoyBand, :Band]

    def count_concerts
        concerts.count
    end

    def concerts_this_month
        date_list = []
        con_dates = self.concerts.map do |concert|
            concert.concert_date
        end
        con_dates.each do |date|
            date.month == Time.now.month && date.year == Time.now.year ? date_list << date : ""
        end
        date_list.count
    end

    def last_concert
        concerts.map {|concert| concert.concert_date}.max
    end

    def most_people
        concerts.map {|concert| concert.attendance}.max
    end

    def longest_concert
        concerts.map {|concert| concert.duration}.max
    end
end
