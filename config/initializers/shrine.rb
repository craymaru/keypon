# REQUIRES
require "shrine"
require "shrine/storage/file_system"

# UPLOAD DIRECTRY
Shrine.storages = {
  cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"),
  store: Shrine::Storage::FileSystem.new("public", prefix: "uploads/store"),
}

# DEFINE PLUGINS
Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data
