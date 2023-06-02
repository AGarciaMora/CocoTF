bash scripts/mkdir.sh -p test_data

bash scripts/pipeline.sh -m motifs/NeuroG1_palate.motif -f input_data/H3K27ac_palate_specific.bed  -o NeuroG1_palate_100 -b genomes/hg38.genome -p test_data

bash scripts/pipeline.sh -m motifs/NeuroG1_palate.motif -f input_data/H3K27ac_palate_specific.bed  -o NeuroG1_palate_50 -b genomes/hg38.genome -p test_data

#bash pipeline.sh -m /home/mbmhtagg/Documents/chapter_2/motif/Atoh1_brain.motif -f /home/mbmhtagg/Documents/chapter_2/enhancer_sequences/H3K27ac_brain_specific.bed -o Atoh1_brain -b hg38.genome -p human_organogenesis

#bash pipeline.sh -m /home/mbmhtagg/Documents/chapter_2/motif/Cdx4_kidney.motif -f /home/mbmhtagg/Documents/chapter_2/enhancer_sequences/H3K27ac_kidney_specific.bed -o Cdx4_kidney -b hg38.genome -p human_organogenesis

#bash pipeline.sh -m /home/mbmhtagg/Documents/chapter_2/motif/Crx_RPE.motif -f /home/mbmhtagg/Documents/chapter_2/enhancer_sequences/H3K27ac_RPE_specific.bed -o Crx_RPE -b hg38.genome -p human_organogenesis

#bash pipeline.sh -m /home/mbmhtagg/Documents/chapter_2/motif/Esr1_adrenal.motif -f /home/mbmhtagg/Documents/chapter_2/enhancer_sequences/H3K27ac_adrenal_specific.bed -o Esr1_adrenal -b hg38.genome -p human_organogenesis

#bash pipeline.sh -m /home/mbmhtagg/Documents/chapter_2/motif/Foxa2_pancreas.motif -f /home/mbmhtagg/Documents/chapter_2/enhancer_sequences/H3K27ac_pancreas_specific.bed -o Foxa2_pancreas -b hg38.genome -p human_organogenesis

#bash pipeline.sh -m /home/mbmhtagg/Documents/chapter_2/motif/FoxA_liver.motif -f /home/mbmhtagg/Documents/chapter_2/enhancer_sequences/H3K27ac_liver_specific.bed -o FoxA_liver -b hg38.genome -p human_organogenesis

#bash pipeline.sh -m /home/mbmhtagg/Documents/chapter_2/motif/Fox_lung.motif -f /home/mbmhtagg/Documents/chapter_2/enhancer_sequences/H3K27ac_lung_specific.bed -o Fox_lung -b hg38.genome -p human_organogenesis

#bash pipeline.sh -m /home/mbmhtagg/Documents/chapter_2/motif/Gata4_ventricle.motif -f /home/mbmhtagg/Documents/chapter_2/enhancer_sequences/H3K27ac_ventricle_specific.bed -o Gata4_ventricle -b hg38.genome -p human_organogenesis

#bash pipeline.sh -m /home/mbmhtagg/Documents/chapter_2/motif/Gata_liver.motif -f /home/mbmhtagg/Documents/chapter_2/enhancer_sequences/H3K27ac_liver_specific.bed -o Gata_liver -b hg38.genome -p human_organogenesis

#bash pipeline.sh -m /home/mbmhtagg/Documents/chapter_2/motif/Hand1_ventricle.motif -f /home/mbmhtagg/Documents/chapter_2/enhancer_sequences/H3K27ac_ventricle_specific.bed -o Hand1_ventricle -b hg38.genome -p human_organogenesis

#bash pipeline.sh -m /home/mbmhtagg/Documents/chapter_2/motif/HNF1_pancreas.motif -f /home/mbmhtagg/Documents/chapter_2/enhancer_sequences/H3K27ac_pancreas_specific.bed -o HNF1_pancreas -b hg38.genome -p human_organogenesis

#bash pipeline.sh -m /home/mbmhtagg/Documents/chapter_2/motif/Hnf4a_liver.motif -f /home/mbmhtagg/Documents/chapter_2/enhancer_sequences/H3K27ac_liver_specific.bed -o Hnf4a_liver -b hg38.genome -p human_organogenesis

#bash pipeline.sh -m /home/mbmhtagg/Documents/chapter_2/motif/Hoxa_upperlimb.motif -f /home/mbmhtagg/Documents/chapter_2/enhancer_sequences/H3K27ac_upperlimb_specific.bed -o Hoxa_upperlimb -b hg38.genome -p human_organogenesis

#bash pipeline.sh -m /home/mbmhtagg/Documents/chapter_2/motif/Hoxb_upperlimb.motif -f /home/mbmhtagg/Documents/chapter_2/enhancer_sequences/H3K27ac_upperlimb_specific.bed -o Hoxb_upperlimb -b hg38.genome -p human_organogenesis

#bash pipeline.sh -m /home/mbmhtagg/Documents/chapter_2/motif/Hoxc9_kidney.motif -f /home/mbmhtagg/Documents/chapter_2/enhancer_sequences/H3K27ac_kidney_specific.bed -o Hoxc9_kidney -b hg38.genome -p human_organogenesis

#bash pipeline.sh -m /home/mbmhtagg/Documents/chapter_2/motif/Hoxd_lowerlimb.motif -f /home/mbmhtagg/Documents/chapter_2/enhancer_sequences/H3K27ac_lowerlimb_specific.bed -o Hoxd_lowerlimb -b hg38.genome -p human_organogenesis

#bash pipeline.sh -m /home/mbmhtagg/Documents/chapter_2/motif/Hoxd_upperlimb.motif -f /home/mbmhtagg/Documents/chapter_2/enhancer_sequences/H3K27ac_upperlimb_specific.bed -o Hoxd_upperlimb -b hg38.genome -p human_organogenesis

#bash pipeline.sh -m /home/mbmhtagg/Documents/chapter_2/motif/Lhx1_brain.motif -f /home/mbmhtagg/Documents/chapter_2/enhancer_sequences/H3K27ac_brain_specific.bed -o Lhx1_brain -b hg38.genome -p human_organogenesis

#bash pipeline.sh -m /home/mbmhtagg/Documents/chapter_2/motif/Lhx5_pancreas.motif -f /home/mbmhtagg/Documents/chapter_2/enhancer_sequences/H3K27ac_pancreas_specific.bed -o Lhx5_pancreas -b hg38.genome -p human_organogenesis

#bash pipeline.sh -m /home/mbmhtagg/Documents/chapter_2/motif/Lhx8_RPE.motif -f /home/mbmhtagg/Documents/chapter_2/enhancer_sequences/H3K27ac_RPE_specific.bed -o Lhx8_RPE -b hg38.genome -p human_organogenesis

#bash pipeline.sh -m /home/mbmhtagg/Documents/chapter_2/motif/Lhx9_lowerlimb.motif -f /home/mbmhtagg/Documents/chapter_2/enhancer_sequences/H3K27ac_lowerlimb_specific.bed -o Lhx9_lowerlimb -b hg38.genome -p human_organogenesis

#bash pipeline.sh -m /home/mbmhtagg/Documents/chapter_2/motif/MyoD_lowerlimb.motif -f /home/mbmhtagg/Documents/chapter_2/enhancer_sequences/H3K27ac_lowerlimb_specific.bed -o MyoD_lowerlimb -b hg38.genome -p human_organogenesis

#bash pipeline.sh -m /home/mbmhtagg/Documents/chapter_2/motif/NeuroG1_palate.motif -f /home/mbmhtagg/Documents/chapter_2/enhancer_sequences/H3K27ac_palate_specific.bed -o NeuroG1_palate -b hg38.genome -p human_organogenesis

#bash pipeline.sh -m /home/mbmhtagg/Documents/chapter_2/motif/Nr5a1_adrenal.motif -f /home/mbmhtagg/Documents/chapter_2/enhancer_sequences/H3K27ac_adrenal_specific.bed -o Nr5a1_adrenal -b hg38.genome -p human_organogenesis

#bash pipeline.sh -m /home/mbmhtagg/Documents/chapter_2/motif/Olig2_palate.motif -f /home/mbmhtagg/Documents/chapter_2/enhancer_sequences/H3K27ac_palate_specific.bed -o Olig2_palate -b hg38.genome -p human_organogenesis

#bash pipeline.sh -m /home/mbmhtagg/Documents/chapter_2/motif/Olig3_upperlimb.motif -f /home/mbmhtagg/Documents/chapter_2/enhancer_sequences/H3K27ac_upperlimb_specific.bed -o Olig3_upperlimb -b hg38.genome -p human_organogenesis

#bash pipeline.sh -m /home/mbmhtagg/Documents/chapter_2/motif/Ptx1_lowerlimb.motif -f /home/mbmhtagg/Documents/chapter_2/enhancer_sequences/H3K27ac_lowerlimb_specific.bed -o Ptx1_lowerlimb -b hg38.genome -p human_organogenesis

#bash pipeline.sh -m /home/mbmhtagg/Documents/chapter_2/motif/Rbpjl_pancreas.motif -f /home/mbmhtagg/Documents/chapter_2/enhancer_sequences/H3K27ac_pancreas_specific.bed -o Rbpjl_pancreas -b hg38.genome -p human_organogenesis

#bash pipeline.sh -m /home/mbmhtagg/Documents/chapter_2/motif/Rfx4_brain.motif -f /home/mbmhtagg/Documents/chapter_2/enhancer_sequences/H3K27ac_brain_specific.bed -o Rfx4_brain -b hg38.genome -p human_organogenesis

#bash pipeline.sh -m /home/mbmhtagg/Documents/chapter_2/motif/Rfx6_lung.motif -f /home/mbmhtagg/Documents/chapter_2/enhancer_sequences/H3K27ac_lung_specific.bed -o Rfx6_lung -b hg38.genome -p human_organogenesis

#bash pipeline.sh -m /home/mbmhtagg/Documents/chapter_2/motif/Six_palate.motif -f /home/mbmhtagg/Documents/chapter_2/enhancer_sequences/H3K27ac_palate_specific.bed -o Six_palate -b hg38.genome -p human_organogenesis

#bash pipeline.sh -m /home/mbmhtagg/Documents/chapter_2/motif/Tbx_ventricle.motif -f /home/mbmhtagg/Documents/chapter_2/enhancer_sequences/H3K27ac_ventricle_specific.bed -o Tbx_ventricle -b hg38.genome -p human_organogenesis

#bash pipeline.sh -m /home/mbmhtagg/Documents/chapter_2/motif/Tcf23_lung.motif -f /home/mbmhtagg/Documents/chapter_2/enhancer_sequences/H3K27ac_liver_specific.bed -o Tcf23_lung -b hg38.genome -p human_organogenesis

#bash pipeline.sh -m /home/mbmhtagg/Documents/chapter_2/motif/Tfap2d_RPE.motif -f /home/mbmhtagg/Documents/chapter_2/enhancer_sequences/H3K27ac_RPE_specific.bed -o Tfap2d_RPE -b hg38.genome -p human_organogenesis

#bash pipeline.sh -m /home/mbmhtagg/Documents/chapter_2/motif/Wt1_kidney.motif -f /home/mbmhtagg/Documents/chapter_2/enhancer_sequences/H3K27ac_kidney_specific.bed -o Wt1_kidney -b hg38.genome -p human_organogenesis



