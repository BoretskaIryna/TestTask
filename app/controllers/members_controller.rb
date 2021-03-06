class MembersController < ApplicationController
  include  ApplicationHelper
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :only_pm, only: [:new, :edit, :create, :update, :destroy]

  # GET /members
  # GET /members.json
  def index
    @members = Member..where(activated: true)
  end

  # GET /members/1
  # GET /members/1.json
  def show
  end

  # GET /members/new
  def new
    @member = Member.new
    @team_id = params[:team_id]
    @users = User.where(:project_manager => false)
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(member_params)
    #@member.team_id = params[:team_id]

    respond_to do |format|
      if @member.save
        MemberMailer.access_activation(User.find(@member.collaborator_id), @member).deliver_now
        flash[:info] = "Please check your email to activate your account."
        #redirect_to root_url


        format.html { redirect_to @member, notice: 'Member was successfully created.' }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to @member, notice: 'Member was successfully updated.' }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:team_id, :collaborator_id)
    end
end
