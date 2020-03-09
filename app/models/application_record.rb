class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

   def self.search(search)
    if search
      places = []
      Post.all.each do |ele|
        places << ele if ele[:country] == search
      end
        if places.length != 0
          return places
        else
          [{notice: "There is 0 result"}]
        end
      else
        [{notice: "There is 0 result"}]
    end
  end
end
