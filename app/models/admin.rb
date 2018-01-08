class Admin < ApplicationRecord
  has_secure_password
  attr_accessor :current_password
  validates :current_password, :presence=>{message: '原密码不能为空'}, on: :update
  validates :email, :presence=> {message: '邮箱不能为空！'}, :uniqueness => {message: '邮箱已经存在'}
  validates :name, :presence=>{message:'名称不能为空'}
  validates :password, :presence => {message: '密码不能为空'}
  validates :password_confirmation, :presence => {message: '密码确认不能为空'}
  validates :password, :confirmation => {message: '两次密码不一致'}, unless: Proc.new{|model| model.password.blank?}

  def update_with_password(params)
    if authenticate(params[:current_password])
      update(params)
    else
      errors.add(:current_password, '原密码错误！') and return false
    end
  end
end
