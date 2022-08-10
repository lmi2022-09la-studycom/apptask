module TasksHelper

    def done_selected?
        if @task.status == "done"
            return true
        else
            return false
        end
    end


end
