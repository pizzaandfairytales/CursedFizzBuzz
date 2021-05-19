require "zlib"
#require 'base64'

data = "1\n2\nFizz\n4\nBuzz\nFizz\n7\n8\nFizz\nBuzz\n11\nFizz\n13\n14\nFizzBuzz\n16\n17\nFizz\n19\nBuzz\nFizz\n22\n23\nFizz\nBuzz\n26\nFizz\n28\n29\nFizzBuzz\n31\n32\nFizz\n34\nBuzz\nFizz\n37\n38\nFizz\nBuzz\n41n\Fizz\n43\n44\nFizzBuzz\n46\n47\nFizz\n49\nBuzz\nFizz\n52\n53\nFizz\nBuzz\n56\nFizz\n58\n59\nFizzBuzz\n61\n62\nFizz\n64\nBuzz\nFizz\n67\n68\nFizz\nBuzz\n71\nFizz\n73\n74\nFizzBuzz\n76\n77\nFizz\n79\nBuzz\nFizz\n82\n83\nFizz\nBuzz\n86\nFizz\n88\n89\nFizzBuzz\n91\n92\nFizz\n94\nBuzz\nFizz\n97\n98\nFizz\nBuzz\n"
compress = Zlib::Deflate.deflate(data)
readable = compress.unpack('H*').first
hex = "0123456789abcdef"

#letters = "abdeghilmnoprstu"
banned = ["burnoose", "burnooses", "burnouse", "burnouses"]
words = File.read("/usr/share/dict/american-english").split.select{ |x| /^[[:lower:]]+$/.match(x) != nil && !banned.include?(x) }
lists = []
seed = 10
permutations = 0
while permutations < 1
  rng = Random.new(seed)
  permutations += 1
  alpha = readable.chars.map { |x| ("a".."z").to_a.select{ |x| "cfjkqvwxyz".scan(/./).find_index(x) == nil }.shuffle(random: rng)[hex.chars.find_index(x)] }.join
  data_interval = 3
  regex = alpha.chars.map { |x| x.to_s + ".." }.join

  outputMode = true
  if outputMode
    if File.exists? "poem.txt"
      code = File.read("poem.txt")
      rng = Random.new(seed)
      puts Zlib::Inflate.inflate(code.downcase.gsub(/[\W&&[^\s]]/, "").split(" ").select{ |x| x.length > 3 }.join.gsub(/\s/, "").chars.select.with_index { |_, i| i % 3 == 0 }.join.chars.map { |x| hex[("a".."z").to_a.select{ |x| "cfjkqvwxyz".chars.find_index(x) == nil }.shuffle(random: rng).find_index(x)] }.join.scan(/../).map { |x| x.hex.chr }.join)
      exit
    end
  end
  
  if !outputMode
    puts "target size: #{regex.size}"
    startcounter = 0
    counter = 0
    done = false
    backingup = false
    options = []
    loop do
      optimize = {}
      print "Startcounter: #{startcounter}\n"
      max = 99999
      if backingup
        max = options.pop()[0].length - 1
        if optimize[startcounter] == nil
          optimize[startcounter] = [max]
        else
          optimize[startcounter].push[max]
        end
      end
      loop do
        if backingup
          backingup = false
        end
        if startcounter + counter >= regex.size
          done = true
          break
        end
        matches = words.select{ |x| (Regexp.new '^' + regex[startcounter..startcounter + counter] + '$').match(x) != nil}
        if matches == nil || matches.size == 0 || counter >= max || (optimize[startcounter] != nil && optimize[startcounter].include?(counter + 1))
          break
        end
        counter += 1
      end
      matches = words.select{ |x| (Regexp.new '^' + regex[startcounter..startcounter + counter - 1] + '$').match(x) != nil}
      if max < 2 || matches[0].length < 4
        if options.size > 0
          backingup = true
          startcounter = startcounter - options[-1][0].length
          done = false
        end
      end

      puts matches
      if !backingup
        options.push matches
        startcounter = startcounter + counter
      end
      counter = 0
      if done == true
        break
      end
    end
    sample = options.map { |x| x[0] }.join(' ')
    puts sample
    File.open("answer.txt", "w").write(sample)
    optionsfile = File.open("choices.txt", "w")
    options.each { |x| optionsfile.write(x); optionsfile.write("\n") }
  end
end
