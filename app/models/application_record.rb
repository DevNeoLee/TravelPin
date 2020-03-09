class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

   def self.search(search)
    if search
      if search.empty?
        return [{notice: "There is 0 result"}]
      end
      places = []
      Post.all.each do |ele|
        places << ele if ele[:country].downcase.include?(search.downcase) || ele[:write].downcase.include?(search.downcase)
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
