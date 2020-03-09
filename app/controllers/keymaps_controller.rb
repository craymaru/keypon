class KeymapsController < ApplicationController
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
    @new_keymap = Keymap.new
  end

  def show
    @keymap = Keymap.find(params[:id])
    @categorized_keymap = @keymap.commands.group_by { |i| i.category_name }
  end

  def edit
    @keymap = Keymap.find(params[:id])
  end

  def create
    new_keymap = Keymap.new(keymap_params)
    if new_keymap.save
      redirect_to keymap_path(new_keymap)
    else
      render :new
    end
  end

  def update
    edit_keymap = Keymap.find(params[:id])
    if edit_keymap.update(keymap_params)
      redirect_to keymap_path(edit_keymap), notice: "Update Sucsess!"
    else
      render :edit
    end
  end

  def destroy
    keymap = Keymap.find(params[:id])
    keymap.destroy
    redirect_to search_keymaps_path
  end

  private

  def keymap_params
    params.require(:keymap).permit(:name, :version, :introduction, :status, :tag_list)
  end

  def search_params
    params.require(:q).permit(:name_cont)
  end
end
