def set_error(message)
  session[:error] = message
end

def display_error
  if session[:error]
    error = session[:error]
    session[:error] = nil
    return "Error: #{error}"
  end
end