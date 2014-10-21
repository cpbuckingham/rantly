class Bio

  def initialize(user_id)
    @user = User.find(user_id)
  end

  def new_comment
    @comment ||= Comment.new
  end

  def user
    @user
  end

  def user_comments
    @comments ||= Comment.where(:commentable_id => @user.id, :commentable_type => "User").sort_by do |comment|
      comment.created_at
    end.reverse
  end

  def user_follows
    @follows ||= Follow.find_by(:user_id => @user.id)
  end

  def user_rants
    @rants ||= Rant.where(:user_id => @user.id).sort_by do |rant|
      rant.favorites.count
    end.reverse
  end

end