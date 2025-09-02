export const aminoacids_list = ['A', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'V', 'W', 'Y'];

export const standar_code = {
  aminoacid_to_rna: {
    A: ["GCU", "GCC", "GCA", "GCG"],
    C: ["UGU", "UGC"],
    D: ["GAU", "GAC"],
    E: ["GAA", "GAG"],
    F: ["UUU", "UUC"],
    G: ["GGU", "GGC", "GGA", "GGG"],
    H: ["CAU", "CAC"],
    I: ["AUU", "AUC", "AUA"],
    K: ["AAA", "AAG"],
    L: ["UUA", "UUG", "CUU", "CUC", "CUA", "CUG"],
    M: ["AUG"],
    N: ["AAU", "AAC"],
    P: ["CCU", "CCC", "CCA", "CCG"],
    Q: ["CAA", "CAG"],
    R: ["AGA", "AGG","CGU","CGC","CGA","CGG"],
    S: ["UCU", "UCC", "UCA", "UCG","AGU","AGC"],
    T: ["ACU", "ACC", "ACA", "ACG"],
    V: ["GUU", "GUC", "GUA", "GUG"],
    W: ["UGG"],
    Y: ["UAU", "UAC"],
    '*': ["UAG","UAA","UGA"]
  },
  aminoacid_to_dna: {
    A: ["GCT", "GCC", "GCA", "GCG"],
    C: ["TGT", "TGC"],
    D: ["GAT", "GAC"],
    E: ["GAA", "GAG"],
    F: ["TTT", "TTC"],
    G: ["GGT", "GGC", "GGA", "GGG"],
    H: ["CAT", "CAC"],
    I: ["ATT", "ATC", "ATA"],
    K: ["AAA", "AAG"],
    L: ["TTA", "TTG", "CTT", "CTC", "CTA", "CTG"],
    M: ["ATG"],
    N: ["AAT", "AAC"],
    P: ["CCT", "CCC", "CCA", "CCG"],
    Q: ["CAA", "CAG"],
    R: ["AGA", "AGG","CGT","CGC","CGA","CGG"],
    S: ["TCT", "TCC", "TCA", "TCG","AGT","AGC"],
    T: ["ACT", "ACC", "ACA", "ACG"],
    V: ["GTT", "GTC", "GTA", "GTG"],
    W: ["TGG"],
    Y: ["TAT", "TAC"],
    '*': ["TAA", "TAG", "TGA"]
  }
}

// Modifications to standar

export const vertebrate_modification = {
  '*': ["AGA", "AGG"],
  M: ["AUA"],
  W: ["UGA"],
  R: ["CGU"],
  I: ["AUU", "AUC"]
}

export const yeast_modification = {
  M: ["AUA"],
  T: ["CUU", "CUC", "CUA", "CUG"],
  W: ["UGA"]
}

export const mold_modification = {
  W: ["UGA"]
}

export const invertebrate_modification = {
  S: ["AGA", "AGG"],
  M: ["AUA"],
  W: ["UGA"],
}

export const cialite_modification = {
  Q: ["UAA", "UAG"]
}

export const echinoderm_modification = {
  N: ["AAA"],
  S: ["AGA", "AGG"],
  W: ["UGA"]
}

export const euplotid_modification = {
  C: ["UGA"]
}

export const alternative_yeast_modification = {
  S: ["CUG"]
}

export const ascidian_modification = {
  G: ["AGA", "AGG"],
  M: ["AUA"],
  W: ["UGA"]
}

export const alternative_flatworm_modification = {
  N: ["AAA"],
  S: ["AGA", "AGG"],
  Y: ["UAA"],
  W: ["UGA"]
}

export const chlorophycean_modification = {
  L: ["TAG"]
}

export const trematore_modification = {
  W: ["TGA"],
  M: ["ATA"],
  S: ["AGA", "AGG"],
  N: ["AAA"]
}

export const scenedesmus_modification = {
  '*': ["TCA"],
  L: ["TAG"]
}

export const pterobranchia_modification = {
  S: ["AGA"],
  K: ["AGG"],
  W: ["UGA"]
}

export const sr1_modificaition = {
  G: ["UGA"]
}

export const pachysolen_modification = {
  A: ["CUG"]
}

export const karyorelict_modification = {
  Q: ["UAG", "UAA"],
  W: ["UGA"]
}

export const condylostoma_modification = {
  Q: ["UAA", "UAG"],
  W: ["UGA"]
}

export const mesodinium_modification = {
  Y: ["UAA", "UAG"]
}

export const peritrich_modification = {
  E: ["UAA", "UAG"]
}

export const blastocrithidia_modification = {
  W: ["UGA"],
  E: ["UAG", "UAA"]
}

export const cephalodiscidae_modification = {
  Y: ["UAA"],
  W: ["UGA"],
  S: ["AGA"],
  K: ["AGG"]
}

export const rna_to_dna = {
  C: "C",
  G: "G",
  U: "T",
  A: "A"
}
export const dna_to_rna = {
  G: "G",
  C: "C",
  A: "A",
  T: "U"
}

export const standarToSpecific = [
    {},
    vertebrate_modification,
    yeast_modification,
    mold_modification,
    invertebrate_modification,
    cialite_modification,
    echinoderm_modification,
    euplotid_modification,
    alternative_yeast_modification,
    ascidian_modification,
    alternative_flatworm_modification,
    chlorophycean_modification,
    trematore_modification,
    scenedesmus_modification,
    pterobranchia_modification,
    sr1_modificaition,
    pachysolen_modification,
    karyorelict_modification,
    condylostoma_modification,
    mesodinium_modification,
    peritrich_modification,
    blastocrithidia_modification,
    cephalodiscidae_modification
]
