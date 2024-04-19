gpu=$1
if [ -z $gpu ]; then
    gpu=0
fi
export CUDA_VISIBLE_DEVICES=$gpu

# /mnt/nas1/RFdiffusion/test/outputs /mnt/nas1/RFdiffusion/outputs/PRLR
file=mpnn_fr/dl_interface_design.py
outpdbdir=/mnt/nas1/RFdiffusion/outputs/PRLR-binders-26-30/RFdiffusion_mpnn_relax
mkdir $outpdbdir
nohup python $file \
    -pdbdir /mnt/nas1/RFdiffusion/outputs/PRLR-binders-26-30/RFdiffusion \
    -outpdbdir $outpdbdir \
    > $file.log 2>&1 &
    # 2>&1  </dev/null | tee $file.log
