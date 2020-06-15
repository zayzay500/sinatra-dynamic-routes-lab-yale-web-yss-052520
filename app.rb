require_relative 'config/environment'

class App < Sinatra::Base
  # Write your code here!
  # accepts a name and renders the name backwards
  get '/reversename/:name' do
    params[:name].reverse
  end

  # accepts a number and returns the square of that number
  get '/square/:number' do
    @number = params[:number].to_i 
    (@number * @number).to_s
  end

  # accepts a number and a phrase and returns that phrase in a single string the number of times given
  get '/say/:number/:phrase' do
    @number = params[:number].to_i
    @phrase = params[:phrase]
    answer = ''
    # binding.pry

    @number.times do 
      answer += @phrase
    end

    answer
  end

  # accepts five words and returns a string containing all five words 
  get '/say/:word1/:word2/:word3/:word4/:word5' do
    answer = "#{params[:word1]} #{params[:word2]} #{params[:word3]} #{params[:word4]} #{params[:word5]}."
  end

  # accepts an operation (add, subtract, multiply or divide) and performs the operation on the two numbers provided, returning a `String`
  get '/:operation/:number1/:number2' do
    number1 = params[:number1].to_i
    number2 = params[:number2].to_i
    
    answer = 'Unable to perform this operation'

    case params[:operation]
    when 'add'
      answer = (number1 + number2).to_s
    when 'subtract'
      answer = (number1 - number2).to_s
    when 'multiply'
      answer = (number1 * number2).to_s
    when 'divide'
      answer = (number1 / number2).to_s
    end
  end
end