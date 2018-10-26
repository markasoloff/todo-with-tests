require 'rails_helper'

  RSpec.describe List, type: :model do
    describe '#complete_all_tasks!' do
      it 'should mark all tasks from the list as complete' do
        list = List.create(name: "Shopping")
        Task.create(complete:false, list_id: list.id, name: "Milk")
        Task.create(complete:false, list_id: list.id, name: "Eggs")
        
        list.complete_all_tasks!
        list.tasks.each do |task|
          expect(task.complete).to eq(true)
        end
      end
    end


    describe '#snooze_all_tasks!' do
      it 'should increment every deadline by 1 hour' do
        times = [5.hours.ago, Time.now, 37.minutes.from_now]

        list = List.create(name: "Fungi")

        times.each do |time|
          Task.create(deadline:time, list_id: list.id)
        end
          
        list.snooze_all_tasks!

        list.tasks.order(:id).each_with_index do |task, index|
          expect(task.deadline).to eq(times[index] + 1.hour) 
        end
      end
    end
  end

