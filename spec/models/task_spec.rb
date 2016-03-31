require 'rails_helper'

RSpec.describe Task, type: :model do
  describe '#toggle_complete!' do
    it 'should switch the complete attribute to false if it started as true' do
      task = Task.create(complete: true)
      task.toggle_complete!
      expect(task.complete).to eq(false)
    end

    it 'should switch the complete attribute to true if it started as false' do
      task = Task.create(complete: false)
      task.toggle_complete!
      expect(task.complete).to eq(true)
    end
  end

  describe '#toggle_favorite!' do
    it 'should switch the favorite attribute to false if it started as true' do
      task = Task.create(favorite: true)
      task.toggle_favorite!
      expect(task.favorite).to eq(false)
    end

    it 'should switch the favorite attribute to true if it started as false' do
      task = Task.create(favorite: false)
      task.toggle_favorite!
      expect(task.favorite).to eq(true)
    end
  end

  describe '#overdue?' do
    it 'should return true if the deadline has passed' do
      task = Task.create(deadline: 1.day.ago)
      expect(task.overdue?).to eq(true)
    end

    it 'should return false if the deadline has not passed' do
      task = Task.create(deadline: 1.day.from_now)
      expect(task.overdue?).to eq(false)
    end
  end

  describe '#increment_priority!' do
    it 'should increase the priority attribute by 1' do
      task = Task.create(priority: 5)
      task.increment_priority!
      expect(task.priority).to eq(6)
    end

    it 'should not increase the priority past 10' do
      task = Task.create(priority: 10)
      task.increment_priority!
      expect(task.priority).to eq(10)
    end
  end

  describe '#decrement_priority!' do
    it 'should decrease the priority attribute by 1' do
      task = Task.create(priority: 5)
      task.decrement_priority!
      expect(task.priority).to eq(4)
    end

    it 'should not decrease the priority past 1' do
      task = Task.create(priority: 1)
      task.decrement_priority!
      expect(task.priority).to eq(1)
    end
  end

  describe '#snooze_hour!' do
    it 'should increase the deadline attribute by 1 hour' do
      my_deadline = Time.current
      task = Task.create(deadline: my_deadline)
      task.snooze_hour!
      expect(task.deadline).to eq(my_deadline + 1.hour)
    end
  end
end
