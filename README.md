# PMF
****
## Code for running QM/MM free energy profiles and surfaces with the AmberTools21 package through Umbrella Sampling

> Requires AmberTools

### 1. System setup
#### 1.1. Necessary files
This PMF generation requires the .ncrst file from a pre-existing equilibration run and a topology file for the enzyme system.
#### 1.2. Editing included files
The md2ps.i file should be edited to cover the appropriate residues in the QM region. This QM region should have the appropriate charge and theory. 
The rc1.RST file should be edited to constrain the distance between the appropriate atoms. The harmonic restraints are written to cover the RC space 0.5 A above and below the specific window's constrained distance and can be left as found in most cases.
