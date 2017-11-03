module API
  module V1
    class Todos < Grape::API
      include API::V1::Defaults

      resource :todos do
        desc "Return all to-dos"
        get "", root: :todos do
          Todo.all
        end

        desc "Return one task"
        params do
          requires :id, type: String, desc: "ID of Todo"
        end
        get ":id", root: "todo" do
          Todo.where(id: permitted_params[:id]).first!
        end

        desc "Create new to-do"
          params do
            requires :description
            requires :endDate
          end
          put "", root: "todo" do
            @todo = Todo.new(params).save
          end

        desc "Delete selected to-do"
          delete ":id", root: "todo" do
            Todo.destroy(params[:id])
          end

      end
    end
  end
end
