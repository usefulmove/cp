export const toRna = dna => {
    return [...dna].map(nuc => {
        switch (nuc) {
          case 'G':
            return 'C';
          case 'C':
            return 'G';
          case 'T':
            return 'A';
          case 'A':
            return 'U';
        }
    }).join("");
};
