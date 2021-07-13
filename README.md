# PMF
****
## Code for running QM/MM free energy profiles and surfaces with the AmberTools21 package through Umbrella Sampling

> Requires AmberTools

### 1. System setup
#### 1.1. Necessary files
This PMF generation requires the .ncrst file from a pre-existing equilibration run and a topology file for the enzyme system.
#### 1.2. Editing included files
The md2ps.i files should be edited to cover the appropriate residues in the QM region. This QM region should have the appropriate charge and theory. 
