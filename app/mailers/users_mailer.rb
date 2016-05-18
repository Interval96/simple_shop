class UsersMailer < ActionMailer::Base
  default from: 'admin@simple-shop.com'

  def order(user, order)
    @user = user
    @order = order
    mail(to: user.email, subject: 'Новый заказ!')
  end

end
