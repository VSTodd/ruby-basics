family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }

imm_fam = family.select {|k,v| (k == :sisters) || (k == :brothers)} 

imm_fam = imm_fam.values.flatten

p imm_fam
