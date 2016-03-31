require 'rails_helper'

RSpec.describe List, type: :model do
  describe '#complete_all_tasks!' do
    it 'should change the complete attribute of all its tasks to true' do
      list = List.create(name: "Chores")
      Task.create(list_id: list.id, complete: false, name: "Take out the garbage and the trash")
      Task.create(list_id: list.id, complete: false, name: "Mow the lawn")
      Task.create(list_id: list.id, complete: true, name: "Sing the song")
      list.complete_all_tasks!
      list.tasks.each do |task|
        expect(task.complete).to eq(true)
      end
    end
  end
end
