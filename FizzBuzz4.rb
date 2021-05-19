require "zlib"
rng = Random.new(10)

poem = "It's a double bonanza for the quick pistols of a twilight riot.
On his deathbed, he saw him vs. the outlaw was blatantly arrogance. 
A decade of pushing comestibles to the loci all of it was bound, all to be got rid of.
He had a pallid hue, and he got into a coughing fit - he was unwell.
'Get in the bathtub! Get in the bunks!'
We are united by moguls, we die for properties.
The numskull reimposed the itching of completed times, 
All his burliness unmade in the purging of cadavers, his items grasped by a pirate mob.

'The poignancy of drunks,' one of the mob did openly exclaim, 'is, we are drunk, but we are pals,
and we launched a war and the moguls are marred. So get the icebox now, 
I'm not hashing out the concepts at the ovum of our games.
Out of all, my mug is by far the bushier! 
I'm not at all aching to say all the precepts, to unpack the organs of our opuses.
If we are harmed, we are harmed. but if the decree is, we are to hang for all we did:
In the end, we are exorcised, we are the tipsiest!'
So he miaowed, blinking at the pushcarts of the semi- brunches the hijacking tithed - ale addled, pig plumped. 
'Diplomas are not for me. I am penning the signal of a hooligan. 
The nobles are our longhorns!' he roars - he is a rhino, but squiggled.

The mob is tangibly, mannishly heroic, 
A restart to brutalize the auditoria of all of us, squirming for the diadem of human beauty.
It's all loanwords, nursed in boyhoods, all the poisonings of the pram -
All the aches a man is born in, and if he is gruff in his phrasings, it's why.
You and I are but hobbyists in the sunset of the hoopla.
To put it mildly, the ovum of our husbands' babble is all the blundered downturns.
I am disabused of the neural palaver of my avuncular audience.
The beauty of the nuclear is, it's potent - so it is universally for the blindest of knights.
But in lieu of the blowup, we are all in limbo."

puts Zlib::Inflate.inflate(poem.downcase.gsub(/[\W&&[^\s]]/, "").split(" ").select{ |x| x.length > 3 }.join.gsub(/\s/, "").chars.select.with_index { |_, i| i % 3 == 0 }.join.chars.map { |x| "0123456789abcdef"[("a".."z").to_a.select{ |x| "cfjkqvwxyz".chars.find_index(x) == nil }.shuffle(random: rng).find_index(x)] }.join.scan(/../).map { |x| x.hex.chr }.join)
