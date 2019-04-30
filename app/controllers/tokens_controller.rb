#
class TokensController < ApplicationController
  before_action :set_token, only: [:show, :edit, :update, ]

  # GET /tokens
  def index
    @user = session[:user]
    @tokens = Token.all
  end

  # GET /tokens/1
  def show
    @user = session[:user]
  end

  def out
    @user = session[:user]
    @tokens = Token.where("creator = '#{@user}' and state_id <> '#{ARCHIVED.id}'")
                  .order('state_id')
  end

  def in
    @user = session[:user]
    @id = session[:user_id]
    @tokens = Token.where("recipient_id = '#{@id}' and state_id <> '#{ARCHIVED.id}'")
                  .order('state_id')
  end

  # GET /tokens/new
  def new
    @user = session[:user]
    @token = Token.new
    @token.build_package
  end


  def edit
    @user = session[:user]
  end

  # POST /tokens
  def create
    @token = Token.new(token_params)
    @token.creator = session[:user]
    @token.state = State.find_by_name('draft')

    if @token.save
      redirect_to @token, notice: 'Token was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tokens/1
  def update
    if @token.update(token_params)
      redirect_to @token, notice: 'Token was successfully updated.'
    else
      render :edit
    end
  end

  def reset
    config = ActiveRecord::Base.connection.adapter_name.downcase.to_sym
    case config
    when :sqlite
      ActiveRecord::Base.connection.execute('DELETE FROM packages')
      ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='packages'")
      ActiveRecord::Base.connection.execute('DELETE FROM tokens')
      ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='tokens'")

    when :postgresql
      ActiveRecord::Base.connection.execute('DELETE FROM packages')
      ActiveRecord::Base.connection.execute('ALTER SEQUENCE packages_id_seq RESTART WITH 1')
      ActiveRecord::Base.connection.execute('DELETE FROM tokens')
      ActiveRecord::Base.connection.execute('ALTER SEQUENCE tokens_id_seq RESTART WITH 1')

    end

  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_token
    @token = Token.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def token_params
    params.require(:token).permit(:id, :state_id, :recipient_id,
                                  package_attributes: [:id, :subject, :request, :response])
  end
end
