import matplotlib.pyplot as plt
import matplotlib
from stringcolor import *
import matplotlib.tri as tri
import numpy as np
plt.rcParams.update({'font.size': 22})
plt.rcParams["figure.figsize"] = [11, 9]
#plt.rcParams.update({'font.size': 22})



x, y, z = [], [], []

# specify path to results file

#path = 'C:/Users/jjg52/Desktop/results/results.dat'
path = 'C:/Users/jjg52/Desktop/results/results1.dat'

# read the 2d pmf data and exclude any energy values over 180 kcal/mol
with open(path, 'r') as f:
    v = list(line for line in (l.strip() for l in f) if line)
    for i in v:
        string = i.split()
        if len(string) >= 3 and float(string[2]) < 180.0:
            x.append(float(string[0]))
            y.append(float(string[1]))
            z.append(float(string[2]))

# specify a list of contour levels for the plot to draw
lt_100 = [j*1.0 for j in range(0, 36)]
gt_100 = [j*2.0 + 36.0 for j in range(10)]
all_levels = sorted(lt_100 + gt_100)


fig, (ax1) = plt.subplots()

# adjust shape of the plot
fig.subplots_adjust(left=0.13, right=0.95, top=0.97, bottom=0.1)


#ax1.tricontour(x, y, z, levels=20, linewidths=0.5, colors='black', linestyles='dashed')
CS = ax1.tricontour(x, y, z, levels=all_levels, linewidths=0.5, colors='black', linestyles='dashed')
cntr1 = ax1.tricontourf(x, y, z, levels=all_levels, cmap="PuOr_r", extend='both', vmax=36)

# if you don't want to manually specify the levels in the plot, just add an integer value for the number of levels 
# and matplotlib will assign them for you

#CS = ax1.tricontour(x, y, z, levels=30, linewidths=0.5, colors='black', linestyles='dashed')
#cntr1 = ax1.tricontourf(x, y, z, levels=30, cmap="PuOr_r", extend='both', vmax=36)

# cbar = fig.colorbar(cntr1, ax=ax1)
# cbar.set_label('Relative Free Energy [kJmol$^{-1}$]', rotation=270, labelpad=25)


#ax1.plot(x, y, 'ko', ms=1)
#ax1.set_title('PM6 Free Energy Surface')
plt.xlabel('INO C$_α$ - N Distance [Å]', color='black')
plt.ylabel('INO C$_α$ - PO4 O Distance [Å]', labelpad=10)
ax1.clabel(CS, CS.levels, manual=True, fmt='%2d', fontsize=10)
#ax1.axis((-0.6, 1.6, 1.35, 2.97))

# # ################### Annotation ############################
#plt.text(1.914, 1.76, 'O', fontsize=10, color='r')
# plt.annotate('B', (2.5,2.0), fontsize=10, color='black', weight='bold')
# plt.annotate('E', (1.51,3.3), fontsize=10, color='black', weight='bold')
# plt.annotate('D', (1.95,3.0), fontsize=10, color='black', weight='bold')
# plt.annotate('C', (2.3,2.75), fontsize=10, color='black', weight='bold')
# # ##########################################################

#ax1.invert_yaxis()
# # ################## Reaction Paths #######################
# plt.plot(p,q, linestyle='--', color='black')
# plt.annotate('Nucleophile Attack', (2.1,1.53), rotation=-10, color='black', fontsize=10)
# plt.plot(qwx,pwx, linestyle='--', color='black')
# plt.annotate('Nucleofuge\n Removal', (2.5,3), rotation=0, color='black', fontsize=10)
# #
# # #########################################################
plt.show()
# plt.savefig('test.png')
