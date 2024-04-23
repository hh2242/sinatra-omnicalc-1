require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:square)
end

get("/square/new") do
  erb(:square)
end

get("/square/results") do
  number = params[:number].to_d
  @square = number * number
  erb(:results)
end

get("/square_root/new") do
  erb(:root)
end

get("/square_root/results") do
  number = params[:number].to_i
  @squareroot = Math.sqrt(number)
  erb(:rootresults)
end

get("/random/new") do
  erb(:random)
end

get("/random/results") do
  user_min = params[:user_min].to_d
  user_max = params[:user_max].to_d
  @num = user_min + rand * (user_max - user_min)
  erb(:randomresults)
end

get("/payment/new") do
  erb(:payments)
end

get("/payment/results") do
  apr = params[:user_apr].to_d
  years = params[:user_years].to_i
  principle = params[:user_pv].to_d
  rate = apr / 100 / 12
  n = years * 12
  numerator = rate * principle
  denom = 1 - ((1 + rate) ** (-n))
  @pay = (numerator / denom)
  erb(:paymentsresults)
end
