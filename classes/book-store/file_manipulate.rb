require 'json'

def convert_to_json(data)
  JSON.pretty_generate(data)
end

def json_to_obj(json)
  JSON.parse(json)
end

def preserve_data(path, data)
  File.write(path, convert_to_json(data))
end

def read_file(path)
  File.exist?(path) ? json_to_obj(File.read(path)) : []
end
