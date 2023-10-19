class AddUserIdToPosts < ActiveRecord::Migration[7.0]
  def change
    user = User.create(email: 'teste@teste.com', password: '123456')
    user = User.first  
    Post.where(user_id: nil).update_all(user_id: user.id)
    Comment.where(user_id: nil).update_all(user_id: user.id)
  end
end
