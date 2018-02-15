require "sinatra"

set :bind, "0.0.0.0"

get "/" do
    erb :index
end

get "/form1" do
    erb :show_form
end

put "/database.csv" do
    save_content(params["first_name"], params["last_name"], params["email"], params["phone"])
    redirect URI.escape("/")
    
end

def save_content(first_name, last_name, email, phone)
    File.open("database.csv", "a") do |file|
      file.print(first_name)
      file.print ","
      file.print(last_name)
      file.print ","
      file.print(email)
      file.print ","
      file.print(phone)
      file.print "\n"
    end
end