require_relative './classes/startup'

def main
  start = Startup.new
  loop do
    start.start
  end
end

main
