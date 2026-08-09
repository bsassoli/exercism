def proteins(strand):
    rna_dict = {'AUG':'Methionine', 'UUU':'Phenylalanine', 'UUC':'Phenylalanine', 'UUA':'Leucine', 'UUG':'Leucine', 'UCU':'Serine', 'UCC':'Serine', 'UCA':'Serine', 'UCG':'Serine', 'UAU':'Tyrosine', 'UAC':'Tyrosine', 'UGU':'Cysteine', 'UGC':'Cysteine', 'UGG':'Tryptophan', 'UAA':'STOP', 'UAG':'STOP', 'UGA':'STOP'}
    lst = []
    start = 0
    end = 3
    length = len(strand)
    while end <= length:
        codon = rna_dict[strand[start:end]]
        if codon == "STOP":
            break
        lst.append(codon)
        start += 3
        end += 3
    return lst
        

