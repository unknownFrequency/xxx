class PicturesUploader < CarrierWave::Uploader::Base
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  storage :file

  def default_url
    "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end


  version :thumb do
    process resize_to_fit: [150, 150]
  end

  version :gallery_thumb do
    process resize_to_fill: [nil, 300]
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

  # Process files as they are uploaded:
   # process scale: [200, 3004
  
   # def scale(width, height)
   #   # do something
   # end

end
