class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def generate_jwt
    JWT.encode({ id: id,
                exp: 1.day.from_now.to_i },
                'c880a82c45b11015ee1b244c01628b94cb61c6a14672a5be42a3f4db26bb3e985f5944773655971b987e46604ad7643987ad7ff946c887d8841dc62b9e461ee0')
  end

end
