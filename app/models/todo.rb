class Todo < ActiveRecord::Base
    belongs_to:user
    def self.overdue
       where("completed = ? and due_date < ?", false, Date.today)
    end
    def self.due_today
        where("due_date = ?", Date.today)
    end
    def self.due_later
        where("due_date > ?", Date.today)
    end
    def self.completed
        all.where(completed: true)
    end
end
