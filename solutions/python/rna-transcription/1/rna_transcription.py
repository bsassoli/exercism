MAP = {
    'G': 'C', 
    'C': 'G',
    'T': 'A',
    'A': 'U'
}


def to_rna(dna_strand):
    return "".join([MAP[strand] for strand in dna_strand])
