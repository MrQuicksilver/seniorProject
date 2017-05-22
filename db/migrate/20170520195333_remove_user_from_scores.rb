class RemoveUserFromScores < ActiveRecord::Migration[5.1]
  def change
    remove_reference :scores, :user, foreign_key: true
  end
end
