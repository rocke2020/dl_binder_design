# 
file=mpnn_fr/dl_interface_design.py
python $file \
    -pdbdir /mnt/nas1/RFdiffusion/test/outputs \
    -outpdbdir /mnt/nas1/RFdiffusion/test/outputs/dl_interface_design \
    2>&1  </dev/null | tee $file.log