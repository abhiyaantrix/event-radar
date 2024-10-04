# frozen_string_literal: true

class AddStatusToOnlineMeetings < ActiveRecord::Migration[7.2]

  def change
    add_column :online_meetings, :status, :integer, limit: 2, default: 0, null: false
  end

end