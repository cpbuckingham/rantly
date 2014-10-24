class Comment < ActiveRecord::Base
  validates_presence_of :body
  belongs_to :user
  belongs_to :rant
  belongs_to :commentable, :polymorphic => true
end