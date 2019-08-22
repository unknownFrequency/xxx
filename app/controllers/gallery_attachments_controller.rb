class GalleryAttachmentsController < ApplicationController
  before_action :set_gallery_attachment, only: [:show, :edit, :update, :destroy]

  # GET /gallery_attachments
  def index
    @gallery_attachments = GalleryAttachment.all
  end

  # GET /gallery_attachments/1
  def show
  end

  # GET /gallery_attachments/new
  def new
    @gallery_attachment = GalleryAttachment.new
  end

  # GET /gallery_attachments/1/edit
  def edit
  end

  # POST /gallery_attachments
  def create
    @gallery_attachment = GalleryAttachment.new(gallery_attachment_params)

    if @gallery_attachment.save
      redirect_to @gallery_attachment, notice: 'Gallery attachment was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /gallery_attachments/1
  def update
    if @gallery_attachment.update(gallery_attachment_params)
      redirect_to @gallery_attachment, notice: 'Gallery attachment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /gallery_attachments/1
  def destroy
    @gallery_attachment.destroy
    redirect_to gallery_attachments_url, notice: 'Gallery attachment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gallery_attachment
      @gallery_attachment = GalleryAttachment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def gallery_attachment_params
      params.require(:gallery_attachment).permit(:user_id, :picture)
    end
end
