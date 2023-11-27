class Api::V1::UsersController < ApplicationController
  def index
    users = User.all
    render json: users.to_json(
      include: {
          address: {},
          invoices: {
            include: {
              client: {
                include: {
                  address: {}
                }
              },
              items: {}
            }
          }
        }
    )
  end

  def show
  end

  def create
  end

  def update
  end

  def delete
  end
end
