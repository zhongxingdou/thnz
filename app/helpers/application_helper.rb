module ApplicationHelper
    def content name
        rec = Label.where(:name => name).first
        return rec ? raw(rec.content) : ""
    end
end
