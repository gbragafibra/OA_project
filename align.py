# Alignment between target sequence and template structure
from modeller import *
env = Environ()

# Read HETATM from pdb file:
env.io.hetatm = True

# Read structure:
aln = Alignment(env)
mdl = Model(env, file='1FCC', model_segment=('FIRST:C','LAST:C'))
aln.append_model(mdl, align_codes='1FCCC', atom_files='1FCC.pdb')

#Read sequence:
aln.append(file='full_1FCC_B.ali', align_codes='full_1FCC_B')

#Sequence-sequence alignment:
aln.align2d()
aln.write(file='alignment_chainB.ali', alignment_format='PIR')