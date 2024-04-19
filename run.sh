gpu=$1
if [ -z $gpu ]; then
    gpu=1
fi
export CUDA_VISIBLE_DEVICES=$gpu

# /mnt/nas1/RFdiffusion/test/outputs /mnt/nas1/RFdiffusion/outputs/PRLR
file=mpnn_fr/dl_interface_design.py
nohup python $file \
    -pdbdir /mnt/nas1/RFdiffusion/outputs/PRLR \
    -outpdbdir /mnt/nas1/RFdiffusion/outputs/PRLR_dl_interface_design \
    > $file.log 2>&1 &
    # 2>&1  </dev/null | tee $file.log
