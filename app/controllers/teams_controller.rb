class TeamsController < ApplicationController
  include  ApplicationHelper

  before_action :set_team, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :only_pm, only: [:new, :edit, :create, :update, :destroy]

  # GET /teams
  # GET /teams.json
  def index
    @user = current_user
    if @user.project_manager
      @teams = Team.where(leader_id: @user.id)
    else
      @teams = collaborator_teams(@user.id)
    #  @teams = Team.where(collaborator_id: @user.id)
    end
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @members = Member.where(team_id: @team.id, activated: true)
  end

  # GET /teams/new
  def new
    debugger
    @team = current_user.teams.build
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = current_user.teams.build(team_params)

    #@team.leader_id = current_user.id

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name)
    end

    def collaborator_teams(id)
      collection = []
      Team.all.each do |team|
        if team.members.ids.include?(id)
          collection << team
        end
      end
      collection
    end

end
