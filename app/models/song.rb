class Song < ActiveRecord::Base
    validates :title, presence: true, uniqueness: { scope: [:artist_name, :release_year],
      message: "should happen once per year with the same artist" }
    validates :released, inclusion: { in: [true, false] }
    validates :release_year, presence: true, numericality: { less_than_or_equal_to: Time.new.year }, if: :released
    validates :artist_name, presence: true
  end