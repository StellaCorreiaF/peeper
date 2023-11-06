class ChangeUserNullConstraintInPosts < ActiveRecord::Migration[7.0]
  def change
    def change
      change_column_null :posts, :user_id, false
    end
  end
end
