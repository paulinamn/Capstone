#!/bin/bash

#SBATCH -p short
#SBATCH -J to_vrt-spfeas
#SBATCH --export=NONE
#SBATCH -t 1-00:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=paulinemnev@gwu.edu


export PATH="/groups/engstromgrp/anaconda3/bin:$PATH"
source activate Ryan_CondaEnvP2.7



###############################################################################
# CREATE VRT AND CONTEXTUAL FEATURES
# 1-1_spfeas_create-vrt-spfeas.py

# Created by: Steven Chao
# Fall 2019
# The George Washington University

# This script takes imagery (multiple) and combines them together to form
# one single image as a VRT file. The first argument is the output .vrt file,
# the remaining arguments are the input TIFs (number depends on how many input
# TIFs you have).

# This script subsequently runs contextual features on each image. Change the
# filepath after -i (should be the VRT) and after -o (should be a folder;
# it will create the folder when running so no need to create beforehand).

# **Once complete, do not move or delete anything within each output folder,
# or else it will mess up the subsequent code. This is how the VRT works.**
###############################################################################


# Create contextual features
# Output folders will be created automatically

# spfeas -i ../data/imagery/McG_Stack_2.tif -o ../outputs/features/McGrath3_fourier --vis-order rgb --block 1 --scales 3 5 7 --tr fourier
# spfeas -i ../data/imagery/McG_Stack_2.tif -o ../outputs/features/McGrath3_gabor --vis-order rgb --block 1 --scales 3 5 7 --tr gabor
# spfeas -i ../data/imagery/McG_Stack_2.tif -o ../outputs/features/McGrath3_hog --vis-order rgb --block 1 --scales 3 5 7 --tr hog
# spfeas -i ../data/imagery/McG_Stack_2.tif -o ../outputs/features/McGrath3_lac --vis-order rgb --block 1 --scales 3 5 7 --tr lac
spfeas -i ../data/imagery/McG_Stack_2.tif -o ../outputs/features/McGrath3_lbpm --vis-order rgb --block 1 --scales 3 5 7 --tr lbpm
spfeas -i ../data/imagery/McG_Stack_2.tif -o ../outputs/features/McGrath3_lsr --vis-order rgb --block 1 --scales 3 5 7 --tr lsr
spfeas -i ../data/imagery/McG_Stack_2.tif -o ../outputs/features/McGrath3_mean --block 1 --scales 3 5 7 --tr mean
spfeas -i ../data/imagery/McG_Stack_2.tif -o ../outputs/features/McGrath3_ndvi --vis-order rgb --block 1 --scales 3 5 7 --tr ndvi
spfeas -i ../data/imagery/McG_Stack_2.tif -o ../outputs/features/McGrath3_orb --vis-order rgb --block 1 --scales 3 5 7 --tr orb
spfeas -i ../data/imagery/McG_Stack_2.tif -o ../outputs/features/McGrath3_pantex --vis-order rgb --block 1 --scales 3 5 7 --tr pantex
spfeas -i ../data/imagery/McG_Stack_2.tif -o ../outputs/features/McGrath3_sfs --vis-order rgb --block 1 --scales 3 5 7 --tr sfs

