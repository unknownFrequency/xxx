class GalleriesController < ApplicationController
  before_action :set_gallery, only: [:show, :edit, :update, :destroy]

  def index
    @galleries = Gallery.all
  end

  def show
    @gallery_attachments = @gallery.gallery_attachments.all
  end

  def new
    @gallery = Gallery.new
    @gallery_attachment = @gallery.gallery_attachments.build
  end

  def edit
  end

  def create
    @gallery = Gallery.new(gallery_params)

    respond_to do |format|
      if @gallery.save
        params[:gallery_attachments]['picture'].each do |pic|
          @gallery_attachment = @gallery.gallery_attachments.create!(picture: pic, gallery_id: @gallery.id)
        end

        format.html { redirect_to @gallery, notice: 'Galleriet er nu uprettet' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    if @gallery.update(gallery_params)
      params[:gallery_attachments]['picture'].each do |a|
        @gallery_attachment = @gallery.gallery_attachments.create!(:picture => a, :gallery_id => @gallery.id)
      end

      redirect_to @gallery, notice: 'Gallery was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /galleries/1
  def destroy
    @gallery.destroy
    redirect_to galleries_url, notice: 'Gallery was successfully destroyed.'
  end

  private
    def set_gallery
      @gallery = Gallery.find(params[:id])
    end

    def gallery_params
      params.require(:gallery).permit(:title, :picture, gallery_attachments_attributes:  [:id, :gallery_id, :picture])
    end
end
