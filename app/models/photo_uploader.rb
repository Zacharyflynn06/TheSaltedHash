class PhotoUploader < CarrierWave::Uploader::Base
    
    storage :file
    
    # def store_dir
    #   "public/images"
    # end
  
    # def cache_dir
    #   "public/images"
    # end
  
    # def extension_whitelist
    #   %w(jpg jpeg gif png)
    # end
  
    # def content_type_whitelist
    #   /image\//
    # end
end