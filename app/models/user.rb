class User < ActiveRecord::Base
    def to_pleasant_string
        #iscompleted=completed ? "[X]" :"[ ]"
        "#{name} "
    end
end