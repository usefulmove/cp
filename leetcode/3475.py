import pandas as pd

def analyze_dna_patterns(samples: pd.DataFrame) -> pd.DataFrame:
    samples['has_start'] = samples.dna_sequence.str.startswith('ATG').apply(int)
    samples['has_stop'] = samples.dna_sequence.str.endswith(('TAA', 'TAG', 'TGA')).apply(int)
    samples['has_atat'] = samples.dna_sequence.str.contains('ATAT').apply(int)
    samples['has_ggg'] = samples.dna_sequence.str.contains('GGG').apply(int)

    return samples.sort_values(by='sample_id', ascending=True)


#def analyze_dna_patterns(samples: pd.DataFrame) -> pd.DataFrame:
#    samples['has_start'] = samples.dna_sequence.str.startswith('ATG').apply(int)
#    samples['has_stop'] = (
#        samples.dna_sequence.str.endswith('TAA').apply(int) +
#        samples.dna_sequence.str.endswith('TAG').apply(int) +
#        samples.dna_sequence.str.endswith('TGA').apply(int)
#    )
#    samples['has_atat'] = samples.dna_sequence.str.contains('ATAT').apply(int)
#    samples['has_ggg'] = samples.dna_sequence.str.contains('GGG').apply(int)
#
#    return samples.sort_values(by='sample_id', ascending=True)


#def analyze_dna_patterns(samples: pd.DataFrame) -> pd.DataFrame:
#    def has_start(dna: str) -> int:
#        return 1 if dna[:3] == "ATG" else 0
#
#    def has_stop(dna: str) -> int:
#        test: str = dna[-3:]
#        if test == "TAA" or test == "TAG" or test == "TGA":
#            return 1
#        else:
#            return 0
#
#    def has_atat(dna: str) -> int:
#        return 1 if "ATAT" in dna else 0
#
#    def has_ggg(dna: str) -> int:
#        return 1 if "GGG" in dna else 0
#
#    samples['has_start'] = samples['dna_sequence'].apply(has_start)
#    samples['has_stop'] = samples['dna_sequence'].apply(has_stop)
#    samples['has_atat'] = samples['dna_sequence'].apply(has_atat)
#    samples['has_ggg'] = samples['dna_sequence'].apply(has_ggg)
#
#    return samples.sort_values(by='sample_id', ascending=True)
