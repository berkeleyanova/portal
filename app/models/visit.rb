class Visit < ActiveRecord::Base
    belongs_to :school
    has_many :siteassignments
end
