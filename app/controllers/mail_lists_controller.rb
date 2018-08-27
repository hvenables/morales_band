# frozen_string_literal: true

class MailListsController < ApplicationController
  def create
    MailList.sign_up(mail_list_params)
    head 201
  end

  private

  def mail_list_params
    params.require(:mail_list).permit(:email, :first_name, :last_name)
  end
end
