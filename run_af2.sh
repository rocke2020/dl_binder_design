gpu=$1
if [ -z $gpu ]; then
    gpu=0
fi
export CUDA_VISIBLE_DEVICES=$gpu

file=af2_initial_guess/predict.py
nohup python $file \
    -pdbdir /mnt/nas1/RFdiffusion/outputs/PRLR-binders-26-30/RFdiffusion_mpnn_relax \
    -outpdbdir /mnt/nas1/RFdiffusion/outputs/PRLR-binders-26-30/af2_predict \
    > $file.log 2>&1 &
# 
# python $file \
#     -pdbdir /mnt/nas1/RFdiffusion/test/outputs/dl_interface_design \
#     -outpdbdir /mnt/nas1/RFdiffusion/test/outputs/af2_predict \
#     2>&1  </dev/null | tee $file.log