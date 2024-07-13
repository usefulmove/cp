def to_rna(dna_strand):
    def transcribe(nuc):
        if nuc == "C":
            return "G"
        elif nuc == "G":
            return "C"
        elif nuc == "A":
            return "U"
        else:
            return "A"

    return "".join(transcribe(nuc) for nuc in dna_strand)
