class Todo < ActiveRecord::Base
    def to_pleasant_string
        iscompleted=completed ? "[X]" :"[ ]"
        "#{id} #{todo_text} #{iscompleted}"
    end
end