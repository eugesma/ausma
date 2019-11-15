class MigrateAssistanceStatuses < ActiveRecord::Migration[5.2]
  def change
    AssistanceStatus.create(name: "Presente")
    AssistanceStatus.create(name: "Ausente")
    AssistanceStatus.create(name: "Ausente s/a")
  end
end
