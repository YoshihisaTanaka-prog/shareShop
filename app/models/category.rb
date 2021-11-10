class Category < ApplicationRecord
    def sub_categories
        ret = []
        sub = Category.where(parent_id: self.id)
        sub.each do |s|
            ret.push s
        end
        sub.each do |s|
            ret.push s.sub_categories
        end
        ret.flatten!
        return ret 
    end
    
    def parents
        ret = []
        if self.parent_id == 0
            return ret
        else
            parent = Category.find(self.parent_id)
            ret.push parent
            ret.push parent.parents
            ret.flatten!
            return ret
        end
    end
end
