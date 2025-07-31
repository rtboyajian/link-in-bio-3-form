Rails.application.routes.draw do
  get("/", { :controller => "items", :action => "index" })
end
