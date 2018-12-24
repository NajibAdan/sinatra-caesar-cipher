require 'sinatra'
require 'sinatra/reloader'

get '/' do
    phrase = params['phrase']
    shift = params['shift'].to_i
    cipher = caesar_cipher(phrase,shift)
    erb :index, :locals =>{:cipher => cipher}
end

def caesar_cipher(phrase,shift=1) 
    return "" if phrase.nil?
    cipherWord = []
    wordsArray = phrase.split
    wordsArray.each do |word|
        cipher = ''
        word.each_byte do |letter|
            i = 0
            while i<shift
                if letter == 90 || letter == 122
                    letter -= 25
                elsif (letter > 64 && letter<123) && !(letter>90 && letter<97)
                    letter = letter + 1
                end
                i +=1
            end
            cipher += letter.chr()
        end
        cipherWord.push(cipher)
    end
    return cipherWord.join(' ')
end