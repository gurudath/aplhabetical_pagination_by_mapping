ALPHABETICAL_PAGINATION_FILE_MAPPING={'Post'=>'title'}


module ActiveRecord
 class Base
  class << self # Class methods
    require 'will_paginate/array'
    def paginate_alphabetically(letter)
        @attribute =  ALPHABETICAL_PAGINATION_FILE_MAPPING[self.new.class.name].to_sym
        letter = (letter.blank? ? 'A' : letter )
        find(:all, :conditions => ["LOWER(#{@attribute.to_s}) LIKE ?", "#{letter.downcase}%"], :order => @attribute)
   end
  end
 end
end
