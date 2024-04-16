# 
file=af2_initial_guess/predict.py
# nohup python $file \
#     -pdbdir /mnt/nas1/RFdiffusion/test/outputs/dl_interface_design \
#     -outpdbdir /mnt/nas1/RFdiffusion/test/outputs/af2_predict \
#     > $file.log 2>&1 &
# 
python $file \
    -pdbdir /mnt/nas1/RFdiffusion/test/outputs/dl_interface_design \
    -outpdbdir /mnt/nas1/RFdiffusion/test/outputs/af2_predict \
    2>&1  </dev/null | tee $file.log