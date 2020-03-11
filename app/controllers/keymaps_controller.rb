class KeymapsController < ApplicationController
  # PV COUNT BY IMPRESSIONIST
  impressionist :actions => [:show]


  def index
  end

  def search
    puts "-- DEBUG -----------------"
    puts "params[:q]:"
    puts params
    puts "--------------------------"

    # SPLIT BY SPACES
    if params[:q].present?
      keywords = params[:q][:name_or_introduction_or_tags_name_cont_all].split(/\p{blank}/)
    end

    puts "-- DEBUG -----------------"
    puts "keywords:"
    puts keywords
    puts "--------------------------"

    @q = Keymap.ransack(name_or_introduction_or_tags_name_cont_all: keywords)
    @keymaps = @q.result(distinct: true).where(status: "Pubric")
  end

  def new
    @keymap = Keymap.new
  end

  def show
    @keymap = Keymap.find(params[:id])
    # PV COUNT BY IMPRESSIONIST
    # if session_hash.blank?
    #   impressionist(@keymap)
    # else
    #   impressionist(@keymap, nil, unique: [:session_hash])
    # end
    @categorized_keymap = @keymap.commands.group_by { |i| i.category_name }
  end

  def edit
    @keymap = Keymap.find(params[:id])
  end

  def create
    @keymap = current_user.keymaps.new(keymap_params)
    puts "-- DEBUG -----------------"
    puts "params[:q]:"
    puts keymap_params
    puts "--------------------------"
    if @keymap.save
      redirect_to keymap_path(@keymap), success: "Successfully Created!"
    else
      flash[:danger] = "Save Error!"
      render :new
    end
  end

  def update
    @keymap = Keymap.find(params[:id])
    if @keymap.update(keymap_params)
      redirect_to keymap_path(@keymap), success: "Successfully Updated!"
    else
      flash[:danger] = "Save Error!"
      render :edit
    end
  end

  def destroy
    @keymap = Keymap.find(params[:id])
    @keymap.destroy
    redirect_to search_keymaps_path
  end

  private

  def keymap_params
    params.require(:keymap).permit(:name, :version, :introduction, :status, :tag_list, :content)
  end

  def search_params
    params.require(:q).permit(:name_cont)
  end
end
