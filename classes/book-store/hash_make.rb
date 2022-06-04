def to_hash(data)
  hash = {}
  data.instance_variables.each { |var| hash[var.to_s.delete('@')] = data.instance_variable_get(var) }
  hash
end
