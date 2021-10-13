class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :language, inclusion: {in: ['Japanese','English','Chinese']}
  validates :email, format: {with: /\A.*kyushu-u.ac.jp\z/}
  validates :room, presence: true
  validates :name, presence: true

  # 同じ部屋番号で登録している人がいないかチェックするためのメソッド
  def check_booking_room
    booking_ids = []
    users = User.where(room: self.room).where.not(id: self.id)
    users.each do |user|
      booking_ids << user.id
    end
    return booking_ids
  end

end
