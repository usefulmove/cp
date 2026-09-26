class Dna(val sequence: String) {
    var counts = mutableMapOf<Char, Int>()
    
    init {
        counts = mutableMapOf<Char, Int>('A' to 0, 'C' to 0, 'G' to 0, 'T' to 0)
        for (c in sequence) {
            if (!(c in "ACGT")) throw IllegalArgumentException("$c is not a valid nucleotide")
            counts[c] = counts.getOrDefault(c, 0) + 1
        }
    }
    
    val nucleotideCounts: Map<Char, Int>
        get() { return counts }
}
