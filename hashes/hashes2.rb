original_hash = {dog: "Hudson",
                lizard: "Bal",
                bird: "Bebe"
                }
new_hash =      {dog: "J'ouvert",
                cat: "Macy",
                rat: "Penelope"
                }
original_hash.merge(new_hash)
puts ".merge : #{original_hash}"

original_hash.merge!(new_hash)
puts ".merge! : #{original_hash}"
